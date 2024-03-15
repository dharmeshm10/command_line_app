import 'package:command_line_app/delivery_cost_calculator/argument_parser/argument_parser.dart';
import 'package:command_line_app/delivery_cost_calculator/argument_parser/command_line_argument_parser.dart';
import 'package:command_line_app/delivery_cost_calculator/constant.dart';
import 'package:command_line_app/delivery_cost_calculator/discount_calculator/discount_calculator.dart';
import 'package:command_line_app/info_reader_and_printer/package_info_reader.dart';
import 'package:command_line_app/delivery_cost_calculator/discount_calculator/discount_validation.dart';
import 'package:command_line_app/delivery_cost_calculator/discount_calculator/simple_discount_calculator.dart';
import 'package:command_line_app/delivery_time_estimation/estimate_time/estimate_time_processor.dart';
import 'package:command_line_app/delivery_time_estimation/estimate_time/model.dart';

// TODO:(Dharmesh) For problem 2 might be error while testing as not fully tested by me.
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

  ///  set discount as per given table
  DiscountCalculator discountCalculator = SimpleDiscountCalculator(
    discountTable: discountTable,
  );

  /// Run time reading from console
  final packageInfoReader = PackageInfoReader();

  /// Validate duplicate offer
  Map<String, bool> appliedDiscounts = {};

  /// We need to store delivery cost
  List<Package> packages = [];

  ///  Validate duplicate discount
  final discountApplier = DiscountValidation(
    discountCalculator: discountCalculator,
    appliedDiscounts: appliedDiscounts,
  );

  /// Get delivery cost as per inputted value && Calculate Estimate time
  final deliveryCostProcessor = EstimateTimeProcessor(
    packageInfoReader: packageInfoReader,
  );
  deliveryCostProcessor.processEstimateTime(
    numberOfPackages: numberOfPackages,
    discountApplier: discountApplier,
    baseDeliveryCost: baseDeliveryCost,
    packages: packages,
  );
}
