import 'package:command_line_app/delivery_cost_calculator/cla_argument_parser.dart';
import 'package:command_line_app/delivery_cost_calculator/cla_constant.dart';
import 'package:command_line_app/delivery_cost_calculator/cla_delivery_cost_calculator.dart';
import 'package:command_line_app/delivery_cost_calculator/cla_delivery_cost_processor.dart';
import 'package:command_line_app/delivery_cost_calculator/discount_calculator/discount_calculator.dart';
import 'package:command_line_app/delivery_cost_calculator/cla_package_info_reader.dart';
import 'package:command_line_app/delivery_cost_calculator/discount_calculator/discount_validation.dart';
import 'package:command_line_app/delivery_cost_calculator/discount_calculator/simple_discount_calculator.dart';

void main(List<String> arguments) {
  /// : Get argument from configuration
  ArgumentParser argumentParser = CommandLineArgumentParser();
  argumentParser.parseArguments(arguments);

  final double baseDeliveryCost = double.parse(arguments[0]);
  final int numberOfPackages = int.parse(arguments[1]);

  print("\n-=-=-=-= Arguments -=-=-=-=");
  print("set baseDeliveryCost:: $baseDeliveryCost");
  print("set numberOfPackages:: $numberOfPackages");
  print("-=-=-=-= End Arguments -=-=-=-=\n");

  ///  set discount as per given table
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

  final deliveryCostCalculator = DeliveryCostCalculator();

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
