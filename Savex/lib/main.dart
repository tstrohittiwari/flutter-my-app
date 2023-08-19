import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savex/data/expense_data.dart';
import 'package:savex/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  // initialize hive
    await Hive.initFlutter();
  // open hive box
    await Hive.openBox("expense_database");


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpenseData(),
      builder: (context, child) => MaterialApp(theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
