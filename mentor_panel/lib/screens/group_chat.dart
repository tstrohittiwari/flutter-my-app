// import 'package:flutter/material.dart';
//
// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});
//
//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("UserName"),
//       ),
//
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'group_chat_bubble.dart';
import 'chatScreen/chat_bubble.dart';
// import 'group_message_model.dart';
import 'group_message_model.dart';


class GroupChat extends StatefulWidget {
  final String groupID = "hsts"; //auth
  final bool isMine = true;
  // const ChatPage({Key? key}) : super(key: key);
  const GroupChat({Key? key}) : super(key: key);
  @override
  State<GroupChat> createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {

  final supabase = SupabaseClient(
    'https://nmxyabbbmxivnmhnrcvb.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5teHlhYmJibXhpdm5taG5yY3ZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc5MTY3NjEsImV4cCI6MjAyMzQ5Mjc2MX0.P6jNcpKKFWl-BOG2TlvfdIa2g48kO_WO7eAMNc404zA',
  );


  bool isAuthentificated() => Supabase.instance.client.auth.currentUser != null;

  String getCurrentUserId() =>
      isAuthentificated() ? Supabase.instance.client.auth.currentUser!.id : '';

  String getCurrentUserEmail() =>
      isAuthentificated() ? Supabase.instance.client.auth.currentUser!.email ?? '' : '';


  // Future<String> _getUserTo(String studentID) async {
  //   final response = await Supabase.instance.client
  //       .from('studentdata')
  //       .select('id')
  //       .not('id', 'eq', getCurrentUserId())
  //       .eq('id', studentID);
  //
  //
  //   return response[0]['id'];
  // }

  Future<void> saveMessage(String content, String groupID) async {
    // final userTo = await _getUserTo(studentID);
    final userFrom = groupID;

    final message = GroupMessage.create(
        content: content, groupID: groupID);

    await Supabase.instance.client.from('groupMessages').insert(message.toMap());
  }



  Future<List<Map<String, dynamic>>> getMessages(groupID) async {
    // final response = await Supabase.instance.client.from('messages').select('content');
    final response = await Supabase.instance.client.from('groupMessages').select('content').eq('groupID', groupID);

    return response;
  }

  final _formKey = GlobalKey<FormState>();
  final _msgController = TextEditingController();



  Future<void> _submit(String groupID) async {
    final text = _msgController.text;

    if (text.isEmpty) {
      return;
    }

    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      await saveMessage(text, groupID);
      await getMessages(groupID);
      setState(() {

      });

      _msgController.text = '';
    }
  }

  @override
  void dispose() {
    _msgController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMessages(widget.groupID);
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body:


      FutureBuilder<List<Map<String, dynamic>>>(
        future: getMessages(widget.groupID),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final messages = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[index]['content'];

                        return GroupChatBubble(message: message,groupID: widget.groupID, isMine: widget.isMine);
                      },
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: _msgController,
                          decoration: InputDecoration(
                              labelText: 'Message',
                              suffixIcon: IconButton(
                                onPressed: () {

                                  _submit(widget.groupID);

                                },
                                icon: const Icon(
                                  Icons.send_rounded,
                                  color: Colors.grey,
                                ),
                              )),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0)
                ],
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
