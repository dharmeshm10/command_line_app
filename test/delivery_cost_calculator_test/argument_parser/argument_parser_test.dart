import 'package:flutter_test/flutter_test.dart';
import '__mock__/mock_argument_parser.dart';

void main() {
  group('CommandLineArgumentParser', () {
    test('Valid arguments', () {
      // Arrange
      var arguments = ['100', '3'];
      var parser = CommandLineArgumentParser();

      // Act & Assert
      expect(() => parser.parseArguments(arguments), returnsNormally);
    });

    test('Missing arguments', () {
      // Arrange
      var arguments = <String>[];
      var parser = CommandLineArgumentParser();

      // Act & Assert
      expect(() => parser.parseArguments(arguments),
          throwsA(isA<FormatException>()));
    });

    test('Negative base delivery cost', () {
      // Arrange
      var arguments = ['-100', '3'];
      var parser = CommandLineArgumentParser();

      // Act & Assert
      expect(() => parser.parseArguments(arguments),
          throwsA(isA<FormatException>()));
    });

    test('Negative number of packages', () {
      // Arrange
      var arguments = ['100', '-3'];
      var parser = CommandLineArgumentParser();

      // Act & Assert
      expect(() => parser.parseArguments(arguments),
          throwsA(isA<FormatException>()));
    });

    test('Negative base delivery cost and number of packages', () {
      // Arrange
      var arguments = ['-100', '-3'];
      var parser = CommandLineArgumentParser();

      // Act & Assert
      expect(() => parser.parseArguments(arguments),
          throwsA(isA<FormatException>()));
    });
  });
}
