import 'package:flutter/material.dart';
import 'package:pomodoro_prac/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // ignore: deprecated_member_use
        backgroundColor: const Color(0xFFE7626C),
        textTheme: const TextTheme(
          // ignore: deprecated_member_use
          headline1: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor: const Color(0xFFF4EDDB),
      ),
      home: HomeScreen(),
    );
  }
}
