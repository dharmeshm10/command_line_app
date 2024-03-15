import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '__mock__/mock_argument_parser.dart';

void main() {
  group('Argument Parsing', () {
    test('Less than 2 arguments', () {
      // Arrange
      var arguments = <String>[];
      var mockParser = MockArgumentParser();

      // Act
      when(mockParser.parseArguments(arguments)).thenAnswer((_) {
        throw Exception('Example exception'); // Or simply throw an exception
      });

      // Assert
      expect(() => mockParser.parseArguments(arguments),
          throwsA(const TypeMatcher<Exception>()));
    });
    test('Exact 2 arguments', () {
      // Arrange
      var arguments = ['100', '3'];
      var mockParser = MockArgumentParser();

      // Act
      mockParser.parseArguments(arguments);

      // Assert
      expect(
          () => mockParser.parseArguments(arguments), isNot(throwsA(anything)));
    });
    test('More than 2 arguments', () {
      // Arrange
      var arguments = ['100', '3', 'extra'];
      var mockParser = MockArgumentParser();

      // Act & Assert
      expect(
          () => mockParser.parseArguments(arguments), isNot(throwsA(anything)));
    });
  });
  group('Argument Parsing for negative number', () {
    test('Negative no_of_packages', () {
      // Arrange
      var arguments = ['100', '-3'];
      var mockParser = MockParser();

      // Act & Assert
      expect(
          () => mockParser.parseArguments(arguments),
          prints(
              '\nInvalid input: base_delivery_cost and no_of_packages must be non-negative numbers.'));
    });
    test('Negative no of base_delivery_cost', () {
      // Arrange
      var arguments = ['-100', '3'];
      var mockParser = MockParser();

      // Act & Assert
      expect(
          () => mockParser.parseArguments(arguments),
          prints(
              '\nInvalid input: base_delivery_cost and no_of_packages must be non-negative numbers.'));
    });
    test('Negative no of base_delivery_cost && no_of_packages', () {
      // Arrange
      var arguments = ['-100', '-3'];
      var mockParser = MockParser();

      // Act & Assert
      expect(
          () => mockParser.parseArguments(arguments),
          prints(
              '\nInvalid input: base_delivery_cost and no_of_packages must be non-negative numbers.'));
    });
  });
}
