import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class GroupChatBubble extends StatefulWidget {
  final String message;
  final String groupID;
  final String senderID;
  final String mentorID = '20993e27-880e-4a3c-8de0-40f5284a9c98';


  const GroupChatBubble(
      {Key? key,
        required this.message,
        required this.groupID,
        required this.senderID})
      : super(key: key);

  @override
  State<GroupChatBubble> createState() => _GroupChatBubbleState();
}

class _GroupChatBubbleState extends State<GroupChatBubble> {

  @override
  Widget build(BuildContext context) {

    return widget.message != null
        ?
    Row(
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
          child: Row(
            mainAxisAlignment: (widget.senderID == widget.mentorID)
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
          ),
        ),


        const SizedBox(width: 12.0),
        Flexible(
          child: Container(

            padding:
            const EdgeInsets.symmetric(vertical: 8, horizontal: 12),

            // mainAxisAlignment:
            // widget.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,


            decoration: BoxDecoration(
              color:
              // widget.isMine ? Colors.grey[600] :
              Colors.indigo[400],
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
