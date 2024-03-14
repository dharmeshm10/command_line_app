import 'package:command_line_app/delivery_cost_calculator/cla_constant.dart';

abstract class DiscountCalculator {
  /// List-out all method
  double calculateDiscount({
    required String offerCode,
    required double distance,
    required double weight,
  });
}

class SimpleDiscountCalculator implements DiscountCalculator {
  final Map<String, Map<String, Map<String, List<int>>>> discountTable;

  SimpleDiscountCalculator({
    required this.discountTable,
  });

  @override
  double calculateDiscount({
    required String offerCode,
    required double distance,
    required double weight,
  }) {
    if (discountTable.containsKey(offerCode)) {
      final offerTable = discountTable[offerCode]!;
      final int distanceInt = distance.toInt();
      final int weightInt = weight.toInt();

      if (distanceInt != null && weightInt != null) {
        for (var distKey in offerTable.keys) {
          if (distKey.startsWith('<')) {
            final distValue = int.parse(distKey.substring(2));
            if (distanceInt < distValue) {
              for (var weightKey in offerTable[distKey]!.keys) {
                final weightValue = offerTable[distKey]![weightKey]!;
                if (weightInt >= weightValue[0] &&
                    weightInt <= weightValue[1]) {
                  return getDiscountPercentage(offerCode);
                }
              }
            }
          } else {
            final distValues =
                distKey.split('-').map((e) => int.parse(e)).toList();
            if (distanceInt >= distValues[0] && distanceInt <= distValues[1]) {
              for (var weightKey in offerTable[distKey]!.keys) {
                final weightValue = offerTable[distKey]![weightKey]!;
                if (weightInt >= weightValue[0] &&
                    weightInt <= weightValue[1]) {
                  return getDiscountPercentage(offerCode);
                }
              }
            }
          }
        }
      }
    }
    return 0.0; // Default to no discount if criteria not found
  }
}
