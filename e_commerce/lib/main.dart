import 'package:e_commerce/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF40BFFF),
        primaryColorDark: const Color(0xFFFB7181),
        primaryColorLight: const Color(0xFFFFC833),
      ),
    );
  }
}
