import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(counter.toString(), style: TextStyle(fontSize: 50)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter++;
          setState(() {});
          print("Counter is : $counter");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
