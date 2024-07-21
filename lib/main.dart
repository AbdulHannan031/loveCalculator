import 'package:flutter/material.dart';
import 'package:love_calculator/splash_screen.dart';
import 'package:love_calculator/home_page.dart';
import 'package:love_calculator/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Love Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/home': (context) => InputScreen(),
        '/result': (context) => ResultScreen(
            result: ModalRoute.of(context)!.settings.arguments as int),
      },
    );
  }
}
