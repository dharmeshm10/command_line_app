import 'package:command_line_app/delivery_cost_calculator/discount_calculator/discount_calculator.dart';

class DiscountValidation {
  DiscountCalculator discountCalculator;
  Map<String, bool> appliedDiscounts;

  DiscountValidation({
    required this.discountCalculator,
    required this.appliedDiscounts,
  });

  // TODO:(Dharmesh) Make it Offer Code optional WIP
  double applyDiscount(
    String offerCode,
    double distance,
    double pkgWeight,
  ) {
    double discount = 0.0;

    if (!appliedDiscounts.containsKey(offerCode.toUpperCase())) {
      discount = discountCalculator.calculateDiscount(
        offerCode: offerCode.toUpperCase(),
        distance: distance,
        weight: pkgWeight,
      );
      appliedDiscounts[offerCode.toUpperCase()] = true;
    }

    return discount;
  }
}
