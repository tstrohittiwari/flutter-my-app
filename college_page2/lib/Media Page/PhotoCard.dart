import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class MyImageCard extends StatelessWidget {
  final List<String> assetImagePaths = [
    'assets/campus/2.jpg',
    'assets/campus/1.jpg',
    'assets/campus/3.jpg',
    'assets/campus/4.jpg',
    'assets/campus/5.jpg',
    'assets/campus/6.jpg',
    'assets/campus/7.jpg',
    'assets/campus/8.jpg',
    'assets/campus/9.jpg',
    // Add more asset image paths as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          style: BorderStyle.solid,
          width: 3,
          color: Colors.deepOrange,
        ),
      ),
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Images',
              style: TextStyle(
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 2.0,
                    color: Colors.black,
                  ),
                ],
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            Divider(color: Colors.deepOrange,),
            Container(
              height: 200.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: assetImagePaths.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhotoViewGallery.builder(
                            itemCount: assetImagePaths.length,
                            builder: (context, index) {
                              return PhotoViewGalleryPageOptions(
                                imageProvider: AssetImage(assetImagePaths[index]),
                                minScale: PhotoViewComputedScale.contained * 0.8,
                                maxScale: PhotoViewComputedScale.covered * 2,
                              );
                            },
                            scrollPhysics: BouncingScrollPhysics(),
                            backgroundDecoration: BoxDecoration(
                              color: Colors.black,
                            ),
                            pageController: PageController(initialPage: index),
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image.asset(
                        assetImagePaths[index],
                        height: 150, // Adjust the width as needed
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
