import 'package:depi_7_25/calculator/calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Calculator Tests", () {
    test("add function is correct", () {
      /// Arrange
      final calc = Calculator();

      /// Act
      final result = calc.add(1, 2);

      /// Assert
      expect(result, 3);
    });
    test("Substract Function is correct", () {
      /// Arrange
      final calc = Calculator();

      /// Act
      final result = calc.subtract(3, 1);

      /// Assert
      expect(result, 2);
    });

    test("Divid is correct", () {
      ///Arrange
      final calc = Calculator();

      ///Act
      final result = calc.divide(9, 0);

      ///Assert
      expect(result, 0);
    });

    test("Multiply is correct", () {
      //arrange
      final calc = Calculator();
      //Act
      final result = calc.multiply(2, 2);
      //Assert
      expect(result, 4);
    });
  });
}
