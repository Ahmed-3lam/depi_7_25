import 'package:flutter_bloc/flutter_bloc.dart';
import 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(const BmiState());

  void updateHeight(double height) {
    emit(state.copyWith(height: height));
  }

  void incrementWeight() {
    emit(state.copyWith(weight: state.weight + 1));
  }

  void decrementWeight() {
    if (state.weight > 0) {
      emit(state.copyWith(weight: state.weight - 1));
    }
  }

  void incrementAge() {
    emit(state.copyWith(age: state.age + 1));
  }

  void decrementAge() {
    if (state.age > 0) {
      emit(state.copyWith(age: state.age - 1));
    }
  }

  void updateSexType(SexType sexType) {
    emit(state.copyWith(sexType: sexType));
  }

  void calculateBmi() {
    if (state.weight > 0 && state.height > 0) {
      final bmiValue = state.weight / (state.height * state.height) * 10000;
      String result;

      switch (bmiValue) {
        case < 18.5:
          result = "Underweight";
          break;
        case >= 18.5 && <= 24.9:
          result = "Normal weight";
          break;
        case >= 25 && <= 29.9:
          result = "Overweight";
          break;
        default:
          result = "Obese";
      }

      emit(state.copyWith(bmiValue: bmiValue, bmiResult: result));
    }
  }

  void resetBmiResult() {
    emit(state.copyWith(bmiResult: null, bmiValue: null));
  }
}
