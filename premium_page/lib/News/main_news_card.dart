import 'package:flutter/material.dart';
import 'package:premium_page/News/detailed_news.dart';

class MainNewsCard extends StatelessWidget {
  const MainNewsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 6),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailedNews()),
          );
        },
        child: SizedBox(
          width: double.infinity,
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 10,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.deepOrange,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: Image.asset(
                    height: 200,
                    "assets/news1.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 2, left: 12, right: 12, top: 12),
                  child: Text(
                    "JoSSA dates for round 2 Announced Click to see dates",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("30 minutes ago"),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.bookmark_add_rounded),
                              iconSize: 24,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.share_rounded),
                              iconSize: 24,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
