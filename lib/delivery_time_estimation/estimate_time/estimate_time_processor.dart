import 'package:command_line_app/info_reader_and_printer/package_info_reader.dart';
import 'package:command_line_app/delivery_cost_calculator/discount_calculator/discount_validation.dart';
import 'package:command_line_app/delivery_time_estimation/estimate_time/model.dart';

class EstimateTimeProcessor {
  final PackageInfoReader packageInfoReader;

  EstimateTimeProcessor({
    required this.packageInfoReader,
  });

  void processEstimateTime({
    required int numberOfPackages,
    required double baseDeliveryCost,
    required DiscountValidation discountApplier,
    required List<Package> packages,
  }) {
    packageInfoReader.calculateEstimateTime(
      numberOfPackages: numberOfPackages,
      packages: packages,
      baseDeliveryCost: baseDeliveryCost,
      discountApplier: discountApplier,
    );
  }
}
