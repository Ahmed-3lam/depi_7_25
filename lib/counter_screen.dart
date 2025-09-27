import 'package:depi_7_25/counter_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: context.read<CounterProvider>().increment,
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (context, provider, child) =>
              Text(provider.count.toString(), style: TextStyle(fontSize: 50)),
        ),
      ),
    );
  }
}

//  return Text(count.toString(), style: TextStyle(fontSize: 50));
