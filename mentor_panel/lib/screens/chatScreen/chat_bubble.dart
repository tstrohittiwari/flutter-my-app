import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'chat_screen.dart';

import 'link_text.dart';
import 'message_model.dart';

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
         widget.isMine ? MainAxisAlignment.start : MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 12.0),
                  Flexible(
                    flex: 75,
                    child: Column(crossAxisAlignment: widget.isMine
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                      children: [
                        Container(

                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          decoration: BoxDecoration(
                            color: widget.isMine
                                ? Colors.green[400]
                                : Colors.indigo[600],
                            borderRadius: widget.isMine
                                ? const BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(0),
                            )
                                : const BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(0),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 6),
                            child: widget.message.contains('https')
                                ? LinkText(
                              url: Uri.parse(extractUrl(widget.message)),
                              text: widget.message,
                            )
                                : Text(
                              widget.message,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(flex:25,child: SizedBox(width: 2,)),
                  const SizedBox(width: 60),
                ],
              )

        : Container();
    }
  String extractUrl(String message) {
    // Implement logic to extract the URL from the message content
    // You can use regular expressions or other techniques
    // Here's a simple example assuming the URL is within parenthesis
    final match = RegExp(r'\((http[s]?:\/\/[^\)]+)\)').firstMatch(message);
    final urlString = match?.group(1) ?? '';
    if (urlString.isNotEmpty) {
      try {
        final uri = Uri.parse(urlString);
        return uri.toString(); // Return the String representation of the parsed Uri
      } on FormatException {
        // Handle potential parsing errors (optional)
        return '';
      }
    }
    return '';
  }

}
