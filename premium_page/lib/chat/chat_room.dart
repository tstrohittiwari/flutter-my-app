import 'package:flutter/material.dart';

class chatRoom extends StatefulWidget {
  final String message;
  final String studentID;
  final bool isMine;

  const ChatBubble({Key? key,required this.message, required this.studentID, required this.isMine}) : super(key: key);

  @override
  State<chatRoom> createState() => _chatRoomState();
}

class _chatRoomState extends State<chatRoom> {
  @override
  Widget build(BuildContext context) {

  }
}
