import 'dart:io';

import 'package:command_line_app/delivery_cost_calculator/discount_calculator/discount_validation.dart';
import 'package:command_line_app/info_reader_and_printer/package_info_printer.dart';
import 'package:command_line_app/delivery_time_estimation/estimate_time/model.dart';

class PackageInfoReader {
  /// Get argument from console
  List<String> readDeliveryCost({
    required int packageNumber,
  }) {
    print(
        'Enter package $packageNumber information (pkg_id pkg_weight_in_kg distance_in_km offer_code):');

    String? input = stdin.readLineSync();
    if (input == null) {
      throw const FormatException('Invalid input');
    }

    List<String> fetchingVehicleInfo = input.split(' ');
    if (fetchingVehicleInfo.length < 4) {
      throw const FormatException('Invalid input');
    }

    String pkgId = fetchingVehicleInfo[0];
    double pkgWeight = double.parse(fetchingVehicleInfo[1]);
    double distance = double.parse(fetchingVehicleInfo[2]);
    String offerCode = fetchingVehicleInfo[3];

    if (pkgWeight < 0 || distance < 0) {
      throw ArgumentError('Package weight and distance must be non-negative');
    }

    return [pkgId, pkgWeight.toString(), distance.toString(), offerCode];
  }

  /// Get argument from console
  void calculateEstimateTime({
    required int numberOfPackages,
    required List<Package> packages,
    required double baseDeliveryCost,
    required DiscountValidation discountApplier,
  }) {
    int packageCount = 0;
    for (packageCount = 0; packageCount < numberOfPackages; packageCount++) {
      print(
          'Enter package ${packageCount + 1} information (pkg_id pkg_weight_in_kg distance_in_km offer_code):');

      String? line = stdin.readLineSync();
      List<String>? parts = line?.split(' ');
      if (parts?.length != 4) {
        print(
            'Invalid input. Please enter package details in the format: pkg_id pkg_weight_in_kg distance_in_km offer_code');
        continue;
      }
      String? id = parts?[0];
      double weight = double.parse(parts![1]);
      double distance = double.parse(parts[2]);
      String offerCode = parts[3];

      packages.add(
        Package(id!, weight, distance, offerCode),
      );
    }

    /// Validate number of package with inputted count
    if (packageCount == numberOfPackages) {
      askVehicleInfo(
        packages: packages,
        baseDeliveryCost: baseDeliveryCost,
        discountApplier: discountApplier,
      );
    }
  }

  void askVehicleInfo({
    required List<Package> packages,
    required double baseDeliveryCost,
    required DiscountValidation discountApplier,
  }) {
    print(
        'Enter the number of vehicles, maximum speed, and maximum carriable weight separated by spaces:');
    String? vehicleLine = stdin.readLineSync();
    List<String>? vehicleParts = vehicleLine?.split(' ');
    int numVehicles = int.parse(vehicleParts![0]);
    double maxSpeed = double.parse(vehicleParts[1]);
    double maxCarriableWeight = double.parse(vehicleParts[2]);

    /// Print inputted value
    final outputPrinter = PackagePrinter();
    outputPrinter.printVehicleInfo(
      noOfVehicles: numVehicles,
      maxSpeed: maxSpeed,
      maxCarriableWeight: maxCarriableWeight,
    );

    /// After getting all necessary input, can ask for estimate time
    getEstimateTime(
      numVehicles: numVehicles,
      maxSpeed: maxSpeed,
      maxCarriableWeight: maxCarriableWeight,
      packages: packages,
      discountApplier: discountApplier,
      baseDeliveryCost: baseDeliveryCost,
    );
  }
}

void getEstimateTime({
  required int numVehicles,
  required double maxSpeed,
  required double maxCarriableWeight,
  required List<Package> packages,
  required DiscountValidation discountApplier,
  required double baseDeliveryCost,
}) {
  List<Vehicle> vehicles = List.generate(
    numVehicles,
    (_) => Vehicle(
      maxCarriableWeight,
      maxSpeed,
    ),
  );

  packages.sort(
    (a, b) => b.weight.compareTo(
      a.weight,
    ),
  );

  for (Package package in packages) {
    Vehicle selectedVehicle = vehicles.reduce(
      (a, b) => a.currentLoad + package.weight <= a.maxWeight
          ? a
          : b.currentLoad + package.weight <= b.maxWeight
              ? b
              : a,
    );
    selectedVehicle.packages.add(package);

    double discount = discountApplier.applyDiscount(
      package.offerCode,
      package.distance,
      package.weight,
    );
    double totalCost =
        baseDeliveryCost + package.weight * package.distance + discount;
    double estimatedDeliveryTime = package.distance / selectedVehicle.speed;

    /// Print estimate time
    final outputPrinter = PackagePrinter();
    print("\n\n-===-=-=-= OUTPUT -===-=-=-=");
    outputPrinter.printEstimateTimeInfo(
      packageId: package.id,
      totalCost: totalCost.toString(),
      estimatedDeliveryTime: estimatedDeliveryTime.toStringAsFixed(2),
    );
  }
}
