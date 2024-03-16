import 'package:flutter/material.dart';
import 'package:mentor_panel/screens/home_page.dart';
import 'package:mentor_panel/screens/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  /// TODO: update Supabase credentials with your own
  await Supabase.initialize(
    url: 'https://nmxyabbbmxivnmhnrcvb.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5teHlhYmJibXhpdm5taG5yY3ZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc5MTY3NjEsImV4cCI6MjAyMzQ5Mjc2MX0.P6jNcpKKFWl-BOG2TlvfdIa2g48kO_WO7eAMNc404zA',
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}


