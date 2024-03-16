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
          throw Exception('Could not launch $url');
        } else {
          // Handle unsupported URL scheme
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Cannot open this link.')));
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
