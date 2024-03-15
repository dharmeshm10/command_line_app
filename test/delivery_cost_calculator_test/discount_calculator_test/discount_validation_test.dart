import '__mock__/mock_discount_calculator.dart';
import 'package:command_line_app/delivery_cost_calculator/discount_calculator/discount_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('applyDiscount returns 0.0 for already applied offer code', () {
    // Arrange
    final discountCalculator = MockDiscountCalculator();
    final appliedDiscounts = {'OFFER123': true};
    final discountValidation = DiscountValidation(
      discountCalculator: discountCalculator,
      appliedDiscounts: appliedDiscounts,
    );

    // Act
    final discount = discountValidation.applyDiscount('OFFER123', 100.0, 10.0);

    // Assert
    expect(discount, equals(0.0));
    expect(appliedDiscounts['OFFER123'], equals(true)); // Should remain true
  });
}
