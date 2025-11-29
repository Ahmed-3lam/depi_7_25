import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      if (event is IncrementCounterEvent) {
        increment++;
        emit(CounterChangedState());
      } else if (event is ChangeScreenColorEvent) {
        emit(CounterChangedScreenColorState(color: Colors.blue));
      }
    });
  }
  int increment = 0;
}
