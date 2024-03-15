abstract class ArgumentParser {
  void parseArguments(List<String> arguments);
}

class CommandLineArgumentParser implements ArgumentParser {
  @override
  void parseArguments(List<String> arguments) {
    if (arguments.length < 2) {
      throw const FormatException('Invalid number of arguments');
    }

    final baseDeliveryCost = double.tryParse(arguments[0]);
    final noOfPackages = int.tryParse(arguments[1]);

    if (baseDeliveryCost == null ||
        noOfPackages == null ||
        baseDeliveryCost < 0 ||
        noOfPackages < 0) {
      throw const FormatException(
          'Invalid input: base_delivery_cost and no_of_packages must be non-negative numbers.');
    }
  }
}
