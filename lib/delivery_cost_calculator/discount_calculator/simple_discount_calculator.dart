import 'package:command_line_app/delivery_cost_calculator/cla_constant.dart';
import 'package:command_line_app/delivery_cost_calculator/discount_calculator/discount_calculator.dart';

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
          if (_isDistanceWithinRange(distKey, distanceInt)) {
            if (_isWeightWithinRange(offerTable[distKey]!, weightInt)) {
              return getDiscountPercentage(offerCode);
            }
          }
        }
      }
    }
    return 0.0; // Default to no discount if criteria not found
  }

  /// Check whether distance within range or not
  bool _isDistanceWithinRange(String distKey, int distanceInt) {
    if (distKey.startsWith('<')) {
      final distValue = int.parse(distKey.substring(2));
      return distanceInt < distValue;
    } else {
      final distValues = distKey.split('-').map((e) => int.parse(e)).toList();
      return distanceInt >= distValues[0] && distanceInt <= distValues[1];
    }
  }

  /// Validate weight
  bool _isWeightWithinRange(Map<String, List<int>> weightTable, int weightInt) {
    for (var weightKey in weightTable.keys) {
      final weightValue = weightTable[weightKey]!;
      if (weightInt >= weightValue[0] && weightInt <= weightValue[1]) {
        return true;
      }
    }
    return false;
  }
}
