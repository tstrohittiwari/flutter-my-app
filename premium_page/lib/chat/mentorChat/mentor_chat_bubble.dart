import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:core';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:package_info_plus/package_info_plus.dart';

import 'link_text.dart';

class ChatBubble extends StatefulWidget {
  final String message;
  final String studentID;
  final bool isMine;
  final DateTime createdTime;

  const ChatBubble(
      {Key? key,
      required this.message,
      required this.studentID,
      required this.isMine,
      required this.createdTime})
      : super(key: key);

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return widget.message != null
        ? Row(
            mainAxisAlignment:
                widget.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              const SizedBox(width: 12.0),
              Flexible(
                child: Column(
                  crossAxisAlignment: widget.isMine
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        color: widget.isMine
                            ? Colors.indigo[600]
                            : Colors.green[400],
                        borderRadius: widget.isMine
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
                    Text(
                      getTimeText(widget.createdTime),
                      style:
                          const TextStyle(color: Colors.grey, fontSize: 12.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
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
        return DateFormat('dd MMM, hh:mm a')
            .format(localTime); // "DD MMM, hh:mm a" (e.g., "09 Mar, 02:30 PM")
      }
    }
  }
}
