import 'package:depi_7_25/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

/// (1) MaterialApp()
/// (2) Scaffold
/// (3) Container()
/// (4) Center
/// (5) Text
/// (6) Padding
/// (7) Column
/// (8) Row
/// (9) Appbar
/// (10) Icon
