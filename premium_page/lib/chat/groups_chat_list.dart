// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
//
// class ChatScreen extends StatefulWidget {
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   final List<Message> messages = [
//     Message(sender: 'You', text: 'Hello!'),
//     Message(sender: 'Friend', text: 'Hi there!'),
//     Message(sender: 'You', text: 'How are you?'),
//     Message(sender: 'Friend', text: 'I am good. How about you?'),
//
//   ];
//
//   final TextEditingController _textController = TextEditingController();
//
//   String currentSender = 'You';
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(useMaterial3: true),
//       home: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color.fromARGB(255, 80, 64, 47),
//               Color.fromARGB(255, 48, 39, 38),
//               Color.fromARGB(255, 28, 22, 25),
//               Color.fromARGB(255, 48, 39, 38),
//             ],
//           ),
//         ),
//         child: Scaffold(
//           backgroundColor: Colors.transparent.withOpacity(0),
//           appBar: AppBar(
//             leading: IconButton(
//               icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//             backgroundColor: Colors.transparent.withOpacity(0),
//             title: Text(
//               "JoSSA",
//               style: TextStyle(color: Colors.white),
//             ),
//             centerTitle: true,
//           ),
//           body: Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: messages.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return MessageBubble(
//                       sender: messages[index].sender,
//                       text: messages[index].text,
//                       isMe: messages[index].sender == 'You',
//                     );
//                   },
//                 ),
//               ),
//               _buildMessageInputField(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildMessageInputField() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               style: TextStyle(color: Colors.white),
//               controller: _textController,
//               decoration: InputDecoration(
//                 hintText: 'Type a message...',
//                 hintStyle: TextStyle(color: Colors.white),
//
//                 contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(25.0),
//                 ),
//               ),
//               onTap: () {
//                 setState(() {
//                   currentSender =
//                       'You'; // Switch to the current user when typing
//                 });
//               },
//             ),
//           ),
//           IconButton(
//             icon: Icon(
//               Icons.send,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               _sendMessage();
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _sendMessage() {
//     if (_textController.text.isNotEmpty) {
//       setState(() {
//         messages.add(Message(sender: 'You', text: _textController.text));
//         _textController.clear();
//         currentSender = 'Friend'; // Switch back to the other user after sending
//       });
//     }
//   }
// }
//
// class Message {
//   final String sender;
//   final String text;
//
//   Message({required this.sender, required this.text});
// }
//
// class MessageBubble extends StatelessWidget {
//   final String sender;
//   final String text;
//   final bool isMe;
//
//   MessageBubble({required this.sender, required this.text, required this.isMe});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment:
//             isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: EdgeInsets.all(8.0),
//             decoration: BoxDecoration(
//               color: isMe ? Colors.blue : Color.fromARGB(255, 255, 229, 107),
//               borderRadius: isMe
//                   ? BorderRadius.only(
//                       bottomLeft: Radius.circular(10),
//                       topLeft: Radius.circular(10),
//                       topRight: Radius.circular(10),
//                     )
//                   : BorderRadius.only(
//                       bottomRight: Radius.circular(10),
//                       topLeft: Radius.circular(10),
//                       topRight: Radius.circular(10),
//                     ),
//             ),
//             child: Text(
//               text,
//               style: TextStyle(color: isMe?Colors.white:Colors.black),
//             ),
//           ),
//           SizedBox(height: 4.0),
//           Row(
//             mainAxisAlignment:
//                 isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
//             children: [
//               Text(
//                 sender,
//                 style: TextStyle(fontSize: 12.0, color: Colors.grey),
//               ),
//               SizedBox(width: 8.0),
//               Text(
//                 // Displaying a simple time for illustration purposes
//                 '10:30 AM',
//                 style: TextStyle(fontSize: 12.0, color: Colors.grey),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'message_model.dart';
import 'group_message_model.dart';
import 'group_chat_bubble.dart';

class ChatScreen extends StatefulWidget {
  final String groupID = "hsts"; //auth
  final bool isMine = false;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // final List<Message> messages = [
  //   Message(sender: 'You', text: 'Hello!'),
  //   Message(sender: 'Friend', text: 'Hi there!'),
  //   Message(sender: 'You', text: 'How are you?'),
  //   Message(sender: 'Friend', text: 'I am good. How about you?'),
  //
  // ];

  bool isAuthentificated() => Supabase.instance.client.auth.currentUser != null;

  String getCurrentUserId() =>
      isAuthentificated() ? Supabase.instance.client.auth.currentUser!.id : '';

  String getCurrentUserEmail() =>
      isAuthentificated() ? Supabase.instance.client.auth.currentUser!.email ??
          '' : '';


  final studentID = '4be86abd-b268-48ee-b59b-02f8bbd92ee9'; //AUTH




  Future<void> saveMessage(String content, String groupID) async {
    // final userTo = await _getUserTo(studentID);
    final userFrom = groupID;

    final message = GroupMessage.create(
        content: content, groupID: groupID);

    await Supabase.instance.client.from('groupMessages').insert(
        message.toMap());
  }

  // Future<List<Map<String, dynamic>>> getMessages(groupID) async {
  //   // final response = await Supabase.instance.client.from('messages').select('content');
  //   final response = await Supabase.instance.client.from('groupMessages')
  //       .select('content')
  //       .eq('groupID', groupID)
  //       .order('created_at');
  //
  //   return response;
  // }
  Stream<List<Map<String, dynamic>>> getMessageStream(groupID) {
    List<Map<String, dynamic>> payload;
    return Supabase.instance.client
        .from('groupMessages')
        .stream(primaryKey: ['id'])
        .eq('groupID', groupID)// Select all columns (you can customize this)
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

      await saveMessage(text, groupID);
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
          print(snapshot);
          if (snapshot.hasData) {
            final messages = snapshot.data!;
            print(messages);

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
                        return GroupChatBubble(message: message, groupID: widget
                            .groupID, isMine: widget.isMine);
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