
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'group_chat_bubble.dart';
import 'chatScreen/chat_bubble.dart';
// import 'group_message_model.dart';
import 'group_message_model.dart';


class GroupChat extends StatefulWidget {
  final String groupID = "hsts"; //auth
  final String mentorID = '20993e27-880e-4a3c-8de0-40f5284a9c98';

  const GroupChat({Key? key}) : super(key: key);

  // AUTH
  // final groupID;
  // const GroupChat({Key? key,required this.groupID}) : super(key: key);
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


  Future<void> saveMessage(String content, String groupID, String mentorID) async {
    // final userTo = await _getUserTo(studentID);
    final userFrom = groupID;

    final message = GroupMessage.create(
        content: content, groupID: groupID, mentorID: widget.mentorID);

    await Supabase.instance.client.from('groupMessages').insert(message.toMap());
  }



  Stream<List<Map<String, dynamic>>> getMessageStream(groupID) {
    List<Map<String, dynamic>> payload;
    return Supabase.instance.client
        .from('groupMessages')
        .stream(primaryKey: ['id'])
        .eq('groupID', groupID)
        .order('created_at')
        .map((event) => event);
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

      await saveMessage(text, groupID, widget.mentorID);
      await getMessageStream(groupID);
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
    getMessageStream(widget.groupID);
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body:


      StreamBuilder<List<Map<String, dynamic>>>(
        stream: getMessageStream(widget.groupID),
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
                        final senderID = messages[index]['senderID'];


                        return GroupChatBubble(message: message, groupID: widget
                            .groupID, senderID: senderID);
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
