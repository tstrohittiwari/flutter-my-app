import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'mentor_chat_bubble.dart';
import 'mentor_message_model.dart';

class MentorChat extends StatefulWidget {

  final String studentID; //AUTH

  final String mentorID = '72598973-636d-4904-be43-cf8035f3144c'; //AUTH


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
        content: content, mentorID: getCurrentUserId(), studentID: userTo,isMine: isMine);

    await Supabase.instance.client.from('messages').insert(message.toMap());
  }


  Stream<List<Map<String, dynamic>>> getMessageStream(studentID) {
    List<Map<String, dynamic>> payload;
    return Supabase.instance.client
        .from('messages')
        .stream(primaryKey: ['id'])
        .inFilter('mentorID, studentID',['cce395ef-9b79-4abf-972f-163d5926c6ef','4be86abd-b268-48ee-b59b-02f8bbd92ee9'] )
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
      await getMessageStream(studentID);
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
    getMessageStream(widget.studentID);
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
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
                        final message = messages[index]['content'];
                        final isMine = messages[index]['isMine'];
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
