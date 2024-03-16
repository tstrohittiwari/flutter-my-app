import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'mentor_chat_bubble.dart';
import 'mentor_message_model.dart';
import 'dart:async';


class MentorChat extends StatefulWidget {

  final String studentID; //AUTH

  final String mentorID = '20993e27-880e-4a3c-8de0-40f5284a9c98'; //AUTH


  // const ChatPage({Key? key}) : super(key: key);
  const MentorChat({Key? key, required this.studentID}) : super(key: key);

  @override
  State<MentorChat> createState() => _MentorChatState();
}

class _MentorChatState extends State<MentorChat> {

  bool isAuthentificated() => Supabase.instance.client.auth.currentUser != null;

  String getCurrentUserId() =>
      isAuthentificated() ? Supabase.instance.client.auth.currentUser!.id : '';

  String getCurrentUserEmail() =>
      isAuthentificated() ? Supabase.instance.client.auth.currentUser!.email ?? '' : '';


  Future<void> saveMessage(String content, String studentID, bool isMine) async {
    // final userTo = await _getUserTo(studentID);
    final userTo = studentID;

    final message = Message.create(
        content: content, mentorID: widget.mentorID, studentID: studentID,isMine: isMine);

    await Supabase.instance.client.from('messages').insert(message.toMap());
  }


  Stream<List<Map<String, dynamic>>> getMessageStream(studentID) {
    List<Map<String, dynamic>> payload;
    return Supabase.instance.client
        .from('messages')
        .stream(primaryKey: ['id'])
        // .inFilter('mentorID, studentID',[widget.mentorID,studentID] )
        .eq('studentID', studentID)
        .order('created_at')
        .map((event) => event);
  }


  final _formKey = GlobalKey<FormState>();
  final _msgController = TextEditingController();



  Future<void> _submit(String studentID, bool isMine) async {
    final text = _msgController.text;

    if (text.isEmpty) {
      return;
    }

    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      await saveMessage(text, studentID, isMine);
      // await getMessageStream(studentID);
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
    Timer.periodic(Duration(seconds: 1), (_) {
      getMessageStream(widget.studentID);
    });
  }

  @override
  Widget build(BuildContext context) {


    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 80, 64, 47),
            Color.fromARGB(255, 48, 39, 38),
            Color.fromARGB(255, 28, 22, 25),
            Color.fromARGB(255, 48, 39, 38),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent.withOpacity(0),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent.withOpacity(0),
          title: const Text('Chat',style: TextStyle(color: Colors.white),),
        ),
        body:


        StreamBuilder<List<Map<String, dynamic>>>(
          stream: getMessageStream(widget.studentID),
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
                          if(messages[index]['mentorID']==widget.mentorID){
                          final message = messages[index]['content'];
                          final isMine = messages[index]['isMine'];
                          DateTime createdTime = DateTime.parse(messages[index]['created_at']);
                          return ChatBubble(message: message,studentID: widget.studentID, isMine: isMine,createdTime: createdTime,);
                        }
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

                                      _submit(widget.studentID, true);
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
                    const SizedBox(height: 10.0)
                  ],
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
