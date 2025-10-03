import 'package:bdver/homePage.dart';
import 'package:bdver/splashScreen.dart';
import 'package:flutter/material.dart';
// MinimalLoginPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), 
    );
  }
}
