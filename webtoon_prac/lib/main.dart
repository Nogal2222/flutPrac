import 'package:flutter/material.dart';
import 'package:webtoon_prac/screens/home_screen.dart';
import 'package:webtoon_prac/servieces/api_service.dart';

void main() {
  ApiService().getTodaysToons();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
