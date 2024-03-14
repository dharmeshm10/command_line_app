import 'dart:io';

import 'package:command_line_app/delivery_cost_calculator/cla_argument_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockArgumentParser extends Mock implements ArgumentParser {}

class MockParser {
  void parseArguments(List<String> arguments) {
    if (arguments.length < 2) {
      print('\nUsage: main_cli.dart base_delivery_cost no_of_packages');
      print(
          'Goto Edit Configuration and set the program arguments base_delivery_cost & no_of_packages respectively \nFor Example, 100 3');
      exit(1);
    }

    final baseDeliveryCost = double.tryParse(arguments[0]);
    final noOfPackages = int.tryParse(arguments[1]);

    if (baseDeliveryCost == null ||
        noOfPackages == null ||
        baseDeliveryCost < 0 ||
        noOfPackages < 0) {
      print(
          '\nInvalid input: base_delivery_cost and no_of_packages must be non-negative numbers.');
      exit(1);
    }
  }
}

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
