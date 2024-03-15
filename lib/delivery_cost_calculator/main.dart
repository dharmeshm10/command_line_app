import 'package:command_line_app/delivery_cost_calculator/argument_parser/argument_parser.dart';
import 'package:command_line_app/delivery_cost_calculator/argument_parser/command_line_argument_parser.dart';
import 'package:command_line_app/delivery_cost_calculator/constant.dart';
import 'package:command_line_app/delivery_cost_calculator/delivery_cost/delivery_cost.dart';
import 'package:command_line_app/delivery_cost_calculator/delivery_cost/delivery_cost_processor.dart';
import 'package:command_line_app/delivery_cost_calculator/discount_calculator/discount_calculator.dart';
import 'package:command_line_app/delivery_cost_calculator/cla_package_info_reader.dart';
import 'package:command_line_app/delivery_cost_calculator/discount_calculator/discount_validation.dart';
import 'package:command_line_app/delivery_cost_calculator/discount_calculator/simple_discount_calculator.dart';

void main(List<String> arguments) {
  /// Get argument from configuration
  ArgumentParser argumentParser = CommandLineArgumentParser();
  argumentParser.parseArguments(arguments);

  final double baseDeliveryCost = double.parse(arguments[0]);
  final int numberOfPackages = int.parse(arguments[1]);

  print("\n-=-=-=-= Arguments -=-=-=-=");
  print("set baseDeliveryCost:: $baseDeliveryCost");
  print("set numberOfPackages:: $numberOfPackages");
  print("-=-=-=-= End Arguments -=-=-=-=\n");

  ///  Set discount as per given table
  DiscountCalculator discountCalculator = SimpleDiscountCalculator(
    discountTable: discountTable,
  );

  /// Run time reading from console
  final packageInfoReader = PackageInfoReader();

  /// Validate duplicate offer
  Map<String, bool> appliedDiscounts = {};

  ///  Validate duplicate discount
  final discountApplier = DiscountValidation(
    discountCalculator: discountCalculator,
    appliedDiscounts: appliedDiscounts,
  );

  final deliveryCostCalculator = DeliveryCost();

  /// Get delivery cost as per inputted value
  final deliveryCostProcessor = DeliveryCostProcessor(
    packageInfoReader: packageInfoReader,
    discountApplier: discountApplier,
    deliveryCostCalculator: deliveryCostCalculator,
  );

  deliveryCostProcessor.processDeliveryCost(
    numberOfPackages: numberOfPackages,
    baseDeliveryCost: baseDeliveryCost,
  );
}
