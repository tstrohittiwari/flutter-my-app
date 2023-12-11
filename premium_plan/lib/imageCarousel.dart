import 'dart:async';
import 'package:flutter/material.dart';

class MyImageCarousel extends StatefulWidget {
  @override
  _MyImageCarouselState createState() => _MyImageCarouselState();
}

class _MyImageCarouselState extends State<MyImageCarousel> {
  int _currentImageIndex = 0;
  final List<String> _imagePaths = ['assest/first.png', 'assest/second.png'];
  bool _shouldFade = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: _animateImages(),
    );
  }

  Widget _animateImages() {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 50),
      opacity: _shouldFade ? 1 : 0,
      child: Image.asset(
        _imagePaths[_currentImageIndex],
        height: 200,
        fit: BoxFit.contain,
      ),
    );
  }

  void _changeImage() {
    setState(() {
      _shouldFade = true;
      _currentImageIndex = (_currentImageIndex + 1) % _imagePaths.length;
    });

    // Fade out after 3 seconds
    Future.delayed(
      Duration(milliseconds: 4700),
          () {
        setState(() {
          _shouldFade = false;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();

    // Set up a timer to change the image every 5 seconds
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      _changeImage();
    });
  }
}
