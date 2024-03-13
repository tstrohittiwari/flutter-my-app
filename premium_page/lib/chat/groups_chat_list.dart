import 'package:flutter/material.dart';
import 'package:premium_page/chat/mentorChat/mentor_Chat.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'group_message_model.dart';
import 'group_chat_bubble.dart';

class ChatScreen extends StatefulWidget {
  final String groupID = "hsts"; //auth
  final bool isMine = false;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isAuthentificated() => Supabase.instance.client.auth.currentUser != null;

  String getCurrentUserId() =>
      isAuthentificated() ? Supabase.instance.client.auth.currentUser!.id : '';

  String getCurrentUserEmail() => isAuthentificated()
      ? Supabase.instance.client.auth.currentUser!.email ?? ''
      : '';

  final studentID = '4be86abd-b268-48ee-b59b-02f8bbd92ee9'; //AUTH

  Future<void> saveMessage(
      String content, String groupID, String studentID) async {
    // final userTo = await _getUserTo(studentID);
    final userFrom = groupID;

    final message = GroupMessage.create(
        content: content, groupID: groupID, studentID: studentID);

    await Supabase.instance.client
        .from('groupMessages')
        .insert(message.toMap());
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

      await saveMessage(text, groupID, studentID);
      await getMessageStream(groupID);
      setState(() {});

      _msgController.text = '';
    }
  }

  @override
  void dispose() {
    _msgController.dispose();
    super.dispose();
  }

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
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MentorChat(studentID: studentID),
                  ),
                );
              },
              child: Text("Mentor Chat"))
        ],
      ),
      body:
      StreamBuilder<List<Map<String, dynamic>>>(
        stream: getMessageStream(widget.groupID),
        builder: (context, snapshot) {
          print(snapshot);
          print("hi");
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
                        return GroupChatBubble(
                            message: message,
                            groupID: widget.groupID,
                            senderID: senderID);
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