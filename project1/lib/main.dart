import 'package:flutter/material.dart';
import 'package:project1/features/home/home_screen.dart';
import 'package:project1/features/posts/ui/post_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
      home: Postscreen(),
    );
  }
}
