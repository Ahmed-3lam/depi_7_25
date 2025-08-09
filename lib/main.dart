import 'package:depi_7_25/whatsapp/home_screen.dart';
import 'package:flutter/material.dart';

import 'bmi_calculator/bmi_screen.dart';
import 'counter/counter_screen.dart';
import 'messanger/messanger_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: BmiScreen());
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
