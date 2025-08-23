import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bmi_calculator/bmi_screen.dart';
import 'bmi_calculator/bmi_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => BmiCubit(),
        child: BmiScreen(),
      ),
    );
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
