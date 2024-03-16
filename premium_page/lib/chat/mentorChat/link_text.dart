import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkText extends StatelessWidget {
  final Uri url;
  final String text;

  const LinkText({Key? key, required this.url, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        if (!await launchUrl(url)) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Could not launch link.'))); // Use a constant message
        }
      },
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blue, // Style the link text here (e.g., underline)
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
