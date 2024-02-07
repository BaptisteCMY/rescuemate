import 'package:flutter/material.dart';
import 'package:rescuemate/pages/HomePage.dart';
import 'package:rescuemate/pages/Inscription.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RescueMate',
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFDDFBFF)),
      home: const HomePage(),
    );
  }
}

