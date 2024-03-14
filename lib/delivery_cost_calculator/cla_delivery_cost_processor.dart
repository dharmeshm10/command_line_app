import 'package:command_line_app/delivery_cost_calculator/cla_delivery_cost_calculator.dart';
import 'package:command_line_app/delivery_cost_calculator/cla_discount_validation.dart';
import 'package:command_line_app/delivery_cost_calculator/cla_package_info_printer.dart';
import 'package:command_line_app/delivery_cost_calculator/cla_package_info_reader.dart';

class DeliveryCostProcessor {
  final PackageInfoReader packageInfoReader;
  final DiscountValidation discountApplier;
  final DeliveryCostCalculator deliveryCostCalculator;
  final PackagePrinter outputPrinter;

  DeliveryCostProcessor({
    required this.packageInfoReader,
    required this.discountApplier,
    required this.deliveryCostCalculator,
    required this.outputPrinter,
  });

  void processDeliveryCost({
    required int numberOfPackages,
    required double baseDeliveryCost,
  }) {
    for (int packageCount = 0;
        packageCount < numberOfPackages;
        packageCount++) {
      final packageInfo = packageInfoReader.readPackageInfo(
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

      outputPrinter.printPackageDetails(
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

  void processDeliveryCostWithEstimateTime({
    required int numberOfPackages,
    required double baseDeliveryCost,
  }) {
    int packageCount = 0;
    for (packageCount; packageCount < numberOfPackages; packageCount++) {
      final packageInfo = packageInfoReader.readPackageInfoForEstimateTime(
        packageNumber: packageCount + 1,
      );

      final String pkgId = packageInfo[0];
      final double pkgWeight = double.parse(packageInfo[1]);
      final double distance = double.parse(packageInfo[2]);
      final String offerCode = packageInfo[3];

      outputPrinter.printPackageDetailsOfEstimateTime(
        pkgId: pkgId,
        distance: distance,
        pkgWeight: pkgWeight,
        offerCode: offerCode,
      );
    }
    if (packageCount == numberOfPackages) {
      final vehicleInfo = packageInfoReader.readVehicleInfo();
      outputPrinter.printVehicleInfo(
        noOfVehicles: int.parse(vehicleInfo[0]),
        maxSpeed: double.parse(vehicleInfo[1]),
        maxCarriableWeight: double.parse(vehicleInfo[2]),
      );
    }
  }
}
