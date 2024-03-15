import 'package:command_line_app/info_reader_and_printer/package_info_printer.dart';
import 'package:command_line_app/info_reader_and_printer/package_info_reader.dart';
import 'package:command_line_app/delivery_cost_calculator/delivery_cost/delivery_cost.dart';
import 'package:command_line_app/delivery_cost_calculator/discount_calculator/discount_validation.dart';

class DeliveryCostProcessor {
  final PackageInfoReader packageInfoReader;
  final DiscountValidation discountApplier;
  final DeliveryCost deliveryCostCalculator;

  DeliveryCostProcessor({
    required this.packageInfoReader,
    required this.discountApplier,
    required this.deliveryCostCalculator,
  });

  void processDeliveryCost({
    required int numberOfPackages,
    required double baseDeliveryCost,
  }) {
    final outputPrinter = PackagePrinter();
    for (int packageCount = 0;
        packageCount < numberOfPackages;
        packageCount++) {
      final packageInfo = packageInfoReader.readDeliveryCost(
        packageNumber: packageCount + 1,
      );

      final String pkgId = packageInfo[0];
      final double pkgWeight = double.parse(packageInfo[1]);
      final double distance = double.parse(packageInfo[2]);
      final String offerCode = packageInfo[3];

      double discount = discountApplier.applyDiscount(
        offerCode,
        distance,
        pkgWeight,
      );

      outputPrinter.printDeliveryCostEstimation(
        pkgId: pkgId,
        distance: distance,
        pkgWeight: pkgWeight,
        offerCode: offerCode,
      );

      double totalCost = deliveryCostCalculator.calculateDeliveryCost(
        baseDeliveryCost: baseDeliveryCost,
        pkgWeight: pkgWeight,
        distance: distance,
      );

      outputPrinter.printDeliveryCost(
        totalCost: totalCost,
      );

      outputPrinter.printDiscount(
        discount: discount,
        totalCost: totalCost,
      );

      totalCost = totalCost - (totalCost * discount);

      outputPrinter.printTotalCost(
        pkgId: pkgId,
        totalCost: totalCost,
      );
    }
  }
}
