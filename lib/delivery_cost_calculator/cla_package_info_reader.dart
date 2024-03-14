import 'dart:io';

class PackageInfoReader {
  /// Get argument from console
  List<String> readPackageInfo({
    required int packageNumber,
  }) {
    print(
        'Enter package $packageNumber information (pkg_id pkg_weight_in_kg distance_in_km offer_code):');

    String? input = stdin.readLineSync();
    if (input == null) {
      throw const FormatException('Invalid input');
    }

    List<String> packageInfo = input.split(' ');
    if (packageInfo.length < 4) {
      throw const FormatException('Invalid input');
    }

    String pkgId = packageInfo[0];
    double pkgWeight = double.parse(packageInfo[1]);
    double distance = double.parse(packageInfo[2]);
    String offerCode = packageInfo[3];

    if (pkgWeight < 0 || distance < 0) {
      throw ArgumentError('Package weight and distance must be non-negative');
    }

    return [pkgId, pkgWeight.toString(), distance.toString(), offerCode];
  }

  List<String> readPackageInfoForEstimateTime({
    required int packageNumber,
  }) {
    print(
        'Enter package $packageNumber information (pkg_id pkg_weight_in_kg distance_in_km offer_code):');

    String? input = stdin.readLineSync();
    if (input == null) {
      throw const FormatException('Invalid input');
    }

    List<String> packageInfo = input.split(' ');
    if (packageInfo.length < 4) {
      throw const FormatException('Invalid input');
    }

    String pkgId = packageInfo[0];
    double pkgWeight = double.parse(packageInfo[1]);
    double distance = double.parse(packageInfo[2]);
    String offerCode = packageInfo[3];

    if (pkgWeight < 0 || distance < 0) {
      throw ArgumentError('Package weight and distance must be non-negative');
    }

    return [pkgId, pkgWeight.toString(), distance.toString(), offerCode];
  }

  List<String> readVehicleInfo() {
    print(
        'Enter vehicle information (no_of_vehicles max_speed max_carriable_weight):');

    String? input = stdin.readLineSync();
    if (input == null) {
      throw const FormatException('Invalid input');
    }

    List<String> packageInfo = input.split(' ');
    if (packageInfo.length < 3) {
      throw const FormatException('Invalid input');
    }

    int noOfVehicles = int.parse(packageInfo[0]);
    int maxSpeed = int.parse(packageInfo[1]);
    double maxCarriableWeight = double.parse(packageInfo[2]);
    double distance = double.parse(packageInfo[2]);

    if (maxCarriableWeight < 0 || distance < 0) {
      throw ArgumentError('Package weight and distance must be non-negative');
    }

    return [
      noOfVehicles.toString(),
      maxSpeed.toString(),
      maxCarriableWeight.toString()
    ];
  }
}
