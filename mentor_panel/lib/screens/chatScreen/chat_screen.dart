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
import 'appService.dart';
import 'message_model.dart';
import 'chat_bubble.dart';
import 'main_chat.dart';

class ChatPage extends StatefulWidget {
  final String studentID;


  // const ChatPage({Key? key}) : super(key: key);
  const ChatPage({Key? key, required this.studentID}) : super(key: key);
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  bool isMine = true;

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

  Future<void> saveMessage(String content, String studentID) async {
    // final userTo = await _getUserTo(studentID);
    final userTo = studentID;

    final message = Message.create(
        content: content, userFrom: getCurrentUserId(), userTo: userTo,isMine: isMine);

    await Supabase.instance.client.from('messages').insert(message.toMap());
  }



  Future<List<Map<String, dynamic>>> getMessages(studentID) async {
    // final response = await Supabase.instance.client.from('messages').select('content');
    final response = await Supabase.instance.client.from('messages').select('content').eq('user_to', studentID);
        // .eq('user_from', mentorId);  IMPORTANT  MENTORID FORM AUTH

    return response;
  }

  final _formKey = GlobalKey<FormState>();
  final _msgController = TextEditingController();



  Future<void> _submit(String studentID) async {
    final text = _msgController.text;

    if (text.isEmpty) {
      return;
    }

    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      await saveMessage(text, studentID);
      await getMessages(studentID);
      isMine = true;
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
    getMessages(widget.studentID);
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body:


      FutureBuilder<List<Map<String, dynamic>>>(
        future: getMessages(widget.studentID),
        builder: (context, snapshot) {
          print(snapshot);
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
                        return ChatBubble(message: message,studentID: widget.studentID, isMine: isMine,);
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
                                    isMine = false;
                                    _submit(widget.studentID);
                                    setState(() {

                                    });
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
