import 'package:college_page2/Media%20Page/PhotoCard.dart';
import 'package:college_page2/Media%20Page/VideoPage.dart';
import 'package:flutter/material.dart';

class MediaMain extends StatelessWidget {
  const MediaMain({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MyImageCard(),
          MyVideoCard(),
        ],
      ),
    );
  }
}
