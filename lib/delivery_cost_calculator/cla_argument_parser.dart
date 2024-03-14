import 'dart:io';

abstract class ArgumentParser {
  void parseArguments(List<String> arguments);
}

class CommandLineArgumentParser implements ArgumentParser {
  @override
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
