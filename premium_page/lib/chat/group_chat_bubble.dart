import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:premium_page/chat/mentorChat/link_text.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GroupChatBubble extends StatefulWidget {
  final String message;
  final String groupID;
  final String senderID;
  final DateTime createdTime;
  final studentID = '4be86abd-b268-48ee-b59b-02f8bbd92ee9';

  const GroupChatBubble({
    Key? key,
    required this.message,
    required this.groupID,
    required this.senderID,
    required this.createdTime,
  }) : super(key: key);

  @override
  State<GroupChatBubble> createState() => _GroupChatBubbleState();
}

// class _GroupChatBubbleState extends State<GroupChatBubble> {
//   @override
//   Widget build(BuildContext context) {
//     return widget.message != null
//         ? Row(
//             children: [
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
//                 child: Row(
//                   mainAxisAlignment: (widget.senderID == widget.studentID)
//                       ? MainAxisAlignment.start
//                       : MainAxisAlignment.end,
//                 ),
//               ),
//
//               const SizedBox(width: 12.0),
//               Flexible(
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//
//                   // mainAxisAlignment:
//                   // widget.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
//
//                   decoration: BoxDecoration(
//                     color:
//                     Colors.indigo[400],
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Text(
//                     widget.message,
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               // const SizedBox(width: 12),
//               // Text(widget.message,
//               //     style: const TextStyle(color: Colors.grey, fontSize: 12.0)),
//               // // MarkAsRead(message: message),
//               // const SizedBox(width: 60),
//             ],
//           )
//         : Container();
//   }
// }

class _GroupChatBubbleState extends State<GroupChatBubble> {
  @override
  Widget build(BuildContext context) {
    return widget.message != null
        ? Row(
            mainAxisAlignment: (widget.senderID == widget.studentID)
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
              //   child: Row(
              //     mainAxisAlignment: (widget.senderID == widget.studentID)
              //         ? MainAxisAlignment.start
              //         : MainAxisAlignment.end,
              //   ),
              // ),

              const SizedBox(width: 12.0),
              Flexible(
                flex: 75,
                child: Column(
                  crossAxisAlignment: (widget.senderID == widget.studentID)
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        color: (widget.senderID == widget.studentID)
                            ? Colors.indigo[600]
                            : Colors.green[400],
                        borderRadius: (widget.senderID == widget.studentID)
                            ? BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(0),
                                bottomLeft: Radius.circular(20),
                              )
                            : BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(0),
                              ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 6),
                        child: _buildMessageContent(widget.message),
                      ),
                    ),
                    Text(
                      getTimeText(widget.createdTime),
                      style:
                          const TextStyle(color: Colors.grey, fontSize: 12.0),
                    ),
                  ],
                ),
              ),
              Flexible(flex:25,child: Container(child: SizedBox(width: 1,),))
              // const SizedBox(width: 12),
              // Text(widget.message,
              //     style: const TextStyle(color: Colors.grey, fontSize: 12.0)),
              // // MarkAsRead(message: message),
              // const SizedBox(width: 60),
            ],
          )
        : Container();
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
}
