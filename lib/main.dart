import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // var box = Hive.box("box1");
  //
  // // box.put("name", "Ahmed");
  //
  // String name = box.get("name");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
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
