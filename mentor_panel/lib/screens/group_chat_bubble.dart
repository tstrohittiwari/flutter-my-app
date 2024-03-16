import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mentor_panel/screens/chatScreen/link_text.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class GroupChatBubble extends StatefulWidget {
  final String message;
  final String groupID;
  final String senderID;
  final String mentorID = '20993e27-880e-4a3c-8de0-40f5284a9c98';
  final DateTime createdTime;


  const GroupChatBubble(
      {Key? key,
        required this.message,
        required this.groupID,
        required this.senderID,
      required this.createdTime})
      : super(key: key);

  @override
  State<GroupChatBubble> createState() => _GroupChatBubbleState();
}

class _GroupChatBubbleState extends State<GroupChatBubble> {

  @override
  Widget build(BuildContext context) {

    return widget.message != null
        ?

    Row( mainAxisAlignment:
    (widget.senderID == widget.mentorID)? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        const SizedBox(width: 12.0),
        Flexible(
          flex: 75,
          child: Column(crossAxisAlignment: (widget.senderID == widget.mentorID)
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
            children: [
              Container(

                padding: const EdgeInsets.symmetric(
                    vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color:  (widget.senderID == widget.mentorID)
                      ? Colors.indigo[600]
                      : Colors.green[400],
                  borderRadius:  (widget.senderID == widget.mentorID)
                      ? const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(0),
                    bottomLeft: Radius.circular(20),
                  )
                      : const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(0),
                  ),
                ),
                child: _buildMessageContent(widget.message),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 6),
                //   child: widget.message.contains('https')
                //       ? LinkText(
                //     url: Uri.parse(extractUrl(widget.message)),
                //     text: widget.message,
                //   )
                //       : Text(
                //     widget.message,
                //     style: const TextStyle(color: Colors.white),
                //   ),
                // ),
              ),
              Text(
                getTimeText(widget.createdTime),
                style:
                const TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
            ],
          ),
        ),
        Flexible(flex:25,child: SizedBox(width: 2,)),
      ],
    )

        : Container();
  }
  // String extractUrl(String message) {
  //   // Implement logic to extract the URL from the message content
  //   // You can use regular expressions or other techniques
  //   // Here's a simple example assuming the URL is within parenthesis
  //   final match = RegExp(r'\((http[s]?:\/\/[^\)]+)\)').firstMatch(message);
  //   final urlString = match?.group(1) ?? '';
  //   if (urlString.isNotEmpty) {
  //     try {
  //       final uri = Uri.parse(urlString);
  //       return uri.toString(); // Return the String representation of the parsed Uri
  //     } on FormatException {
  //       // Handle potential parsing errors (optional)
  //       return '';
  //     }
  //   }
  //   return '';
  // }

  Widget _buildMessageContent(String message) {
    final Uri? url;
    if(message.startsWith('https', 0)){
      url = Uri.tryParse(message);
    }else if(message.startsWith('meet', 0) ||message.startsWith('drive', 0) ){
      url = Uri.tryParse('https://$message');
      print(url);
    }

      else{
      url = null;
    }
    // Only treat the message as a URL if it has a valid URL format

    print(url);
    if (url!=null ) {
      print("object");
      return LinkText(url: url, text: message);
    } else {
      // Plain text message
      return Text(message, style: const TextStyle(color: Colors.white));
    }
  }
  String getTimeText(DateTime createdTime) {
    final now = DateTime.now();
    final localTime = widget.createdTime.toLocal(); // Convert to local time

    final difference = now.difference(localTime);

    if (difference.inSeconds < 60) {
      return "Just now";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} minute(s) ago";
    } else if (difference.inHours < 2) {
      return "${difference.inHours} hour(s) ago";
    } else {
      // Check if it's today or yesterday
      final today = DateTime.now();
      final yesterday = today.subtract(const Duration(days: 1));

      if (localTime.year == today.year &&
          localTime.month == today.month &&
          localTime.day == today.day) {
        // Today
        return DateFormat('hh:mm a').format(localTime);
      } else if (localTime.year == yesterday.year &&
          localTime.month == yesterday.month &&
          localTime.day == yesterday.day) {
        // Yesterday
        return "Yesterday, ${DateFormat('hh:mm a').format(localTime)}";
      } else {
        // Older messages (including dates)
        return DateFormat('dd MMM, hh:mm a').format(localTime);  // "DD MMM, hh:mm a" (e.g., "09 Mar, 02:30 PM")
      }
    }
  }

}
