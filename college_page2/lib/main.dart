import 'package:college_page2/Cutoff/Cutoff.dart';
import 'package:college_page2/Media%20Page/MediaMain.dart';
import 'package:college_page2/PlacementRecords/PlacementTab.dart';
import 'package:college_page2/about/About.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this); // 6 tabs
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'NIT Warangal',
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
        bottom: TabBar(
          labelColor: Colors.deepOrange,
          indicatorColor: Colors.deepOrange,
          isScrollable: true,
          controller: _tabController,
          tabs: [
            Tab(text: 'About'),
            Tab(text: 'Cutoffs'),
            Tab(text: 'Placement Records'),
            Tab(text: 'Media'),
            Tab(text: 'Admission'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Replace these with your corresponding widgets for each tab
          AboutPage(),
          CutoffPage(),
          PlacementsTab(),
          MediaMain(),
          Center(child: Text('Admission Page')),

        ],
      ),
    );
  }
}
