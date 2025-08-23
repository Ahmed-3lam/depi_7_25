import 'package:equatable/equatable.dart';

enum SexType { MALE, FEMALE }

class BmiState extends Equatable {
  final double height;
  final double weight;
  final double age;
  final SexType sexType;
  final String? bmiResult;
  final double? bmiValue;

  const BmiState({
    this.height = 100,
    this.weight = 0,
    this.age = 0,
    this.sexType = SexType.MALE,
    this.bmiResult,
    this.bmiValue,
  });

  BmiState copyWith({
    double? height,
    double? weight,
    double? age,
    SexType? sexType,
    String? bmiResult,
    double? bmiValue,
  }) {
    return BmiState(
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      sexType: sexType ?? this.sexType,
      bmiResult: bmiResult ?? this.bmiResult,
      bmiValue: bmiValue ?? this.bmiValue,
    );
  }

  @override
  List<Object?> get props => [height, weight, age, sexType, bmiResult, bmiValue];
}
