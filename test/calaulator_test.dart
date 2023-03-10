import 'package:calculator/calculator.dart';
import 'package:test/test.dart';

void main() {
  group("Calculator", () {
    late Calculator calculator;

    setUp(() {
      calculator = Calculator();
    });

    tearDown(() {
      calculator.value = "0";
      calculator.operator = "";
      calculator.oldValue = "";
    });

    // This will run only once when run tests
    setUpAll(() {});

    // This will run only once when all tests finish
    tearDownAll(() {});

    test("calculator should mutiply 2 by 6 then get 12", () {
      // Arrange or Given
      calculator.value = "2";
      calculator.operator = "x";
      calculator.oldValue = "6";

      // Act or When
      calculator.calculate();

      // Assert or Then
      expect(calculator.value, "12");
    });
  });
}
