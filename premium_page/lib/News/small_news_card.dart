import 'package:flutter/material.dart';

import 'detailed_news.dart';


class SmallNewsCard extends StatelessWidget {
  const SmallNewsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 6),
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
                      height: 100,
                      "assets/news1.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 2, left: 6, right: 6, top: 6),
                    child: Text(
                      "JoSSA dates for round 2 Announced Click to see dates",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 3, horizontal: 6),
                    child: Container(
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text("30 minutes ago",style: TextStyle(fontSize: 10),),
                          Row(
                            children: [
                              SizedBox(

                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.bookmark_add_rounded),
                                  iconSize: 16,
                                ),
                                height: 34,
                                width: 34,
                              ),
                              SizedBox(

                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.share_rounded),
                                  iconSize: 16,
                                ),
                                height: 34,
                                width: 34,
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
      ),
    );
  }
}
