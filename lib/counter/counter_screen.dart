import 'package:depi_7_25/counter/bloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    // final counterBloc = context.read<CounterBloc>();

    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state is CounterChangedScreenColorState
              ? state.color
              : null,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              children: [
                FloatingActionButton(
                  key: Key("FloatinBtn"),
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementCounterEvent());
                  },
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(ChangeScreenColorEvent());
                  },
                  child: Icon(Icons.color_lens),
                ),
              ],
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(key: Key("Hello Text"),"Hello"),
              BlocBuilder<CounterBloc, CounterState>(
                builder: (ctx, state) {
                  return Text(
                    "${ctx.read<CounterBloc>().increment}",
                    style: TextStyle(fontSize: 24),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
