import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const HatyApp());
}

class HatyApp extends StatelessWidget {
  const HatyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HATY - Learn to Read',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.deepOrange,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFF8E7),
      ),
      home: const HomeScreen(),
    );
  }
}
