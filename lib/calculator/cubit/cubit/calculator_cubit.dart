import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class CalculatorCubit extends Cubit<int> {
  CalculatorCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
