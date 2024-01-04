import 'package:flutter/material.dart';
import 'package:premium_page/News/small_news_card.dart';
import 'main_news_card.dart';

class NewsHome extends StatelessWidget {
  const NewsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'News',
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(0.5, 1.0),
                blurRadius: 2.0,
                color: Colors.black,
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainNewsCard(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: Divider(height: 3, color: Colors.black,thickness: 3,),
            ),
            Row(
              children: [
                SmallNewsCard(),
                SmallNewsCard(),
              ],
            ),
            Row(
              children: [
                SmallNewsCard(),
                SmallNewsCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

