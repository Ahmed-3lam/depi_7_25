import 'package:bloc_test/bloc_test.dart';
import 'package:depi_7_25/calculator/cubit/cubit/calculator_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Counter Cubit Test", () {
    blocTest<CalculatorCubit, int>(
      'emits [1] when Increment is called',
      build: () => CalculatorCubit(),
      act: (cubit) => cubit.increment(),
      expect: () => [1],
    );

    blocTest<CalculatorCubit, int>(
      'emits [-1] when Increment is called',
      build: () => CalculatorCubit(),
      act: (cubit) => cubit.decrement(),
      expect: () => [-1],
    );
  });
}
