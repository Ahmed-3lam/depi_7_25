import 'package:depi_7_25/helpers/hive_helper.dart';
import 'package:depi_7_25/screen/note_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(HiveHelper.noteBox);
  await HiveHelper.getMyNotes();
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
    return MaterialApp(debugShowCheckedModeBanner: false, home: NoteScreen());
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
