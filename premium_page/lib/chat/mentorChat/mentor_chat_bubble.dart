import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class ChatBubble extends StatefulWidget {
  final String message;
  final String studentID;
  final bool isMine;

  const ChatBubble({Key? key,required this.message, required this.studentID, required this.isMine}) : super(key: key);

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {



  @override
  Widget build(BuildContext context) {

    return widget.message != null
        ?

    Row( mainAxisAlignment:
    widget.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        const SizedBox(width: 12.0),
        Flexible(
          child: Container(

            padding:
            const EdgeInsets.symmetric(vertical: 8, horizontal: 12),

            decoration: BoxDecoration(
              color: widget.isMine ? Colors.grey[600] : Colors.indigo[400],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              widget.message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(widget.message,
            style: const TextStyle(color: Colors.grey, fontSize: 12.0)),
        // MarkAsRead(message: message),
        const SizedBox(width: 60),
      ],
    )

        : Container();
  }
}
