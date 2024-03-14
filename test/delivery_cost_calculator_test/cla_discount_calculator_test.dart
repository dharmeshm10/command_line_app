import 'package:command_line_app/delivery_cost_calculator/cla_constant.dart';
import 'package:command_line_app/delivery_cost_calculator/cla_discount_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Discount Calculator', () {
    test('Calculate discount for testOffer001', () {
      // MockData
      const String testOffer001 = 'testOffer001';
      const Map<String, Map<String, Map<String, List<int>>>> mockDiscountTable =
          {
        testOffer001: {
          '< 200': {
            '70-200': [70, 200], // 10% Discount
          },
        },
      };

      // Arrange
      var calculator = SimpleDiscountCalculator(
        discountTable: mockDiscountTable,
      );

      // Act
      var discount = calculator.calculateDiscount(
        offerCode: testOffer001,
        distance: 100,
        weight: 150,
      );

      // Assert offer not found because not added in actual data
      expect(discount, 0.0); // 10% discount
    });
    test('Calculate discount for offer1 [Test with real offer]', () {
      // Arrange
      var calculator = SimpleDiscountCalculator(discountTable: discountTable);

      // Act
      var discount = calculator.calculateDiscount(
        offerCode: offer1,
        distance: 100,
        weight: 150,
      );

      // Assert
      expect(discount, 0.10); // 10% discount
    });
  });
  group('Discount Calculation', () {
    test('Offer 1 Discount Percentage', () {
      // Arrange
      const offerCode = 'OFR001';

      // Act
      final discountPercentage = getDiscountPercentage(offerCode);

      // Assert
      expect(discountPercentage, 0.10);
    });

    test('Offer 2 Discount Percentage', () {
      // Arrange
      const offerCode = 'OFR002';

      // Act
      final discountPercentage = getDiscountPercentage(offerCode);

      // Assert
      expect(discountPercentage, 0.07);
    });

    test('Offer 3 Discount Percentage', () {
      // Arrange
      const offerCode = 'OFR003';

      // Act
      final discountPercentage = getDiscountPercentage(offerCode);

      // Assert
      expect(discountPercentage, 0.05);
    });

    test('Unknown Offer Discount Percentage', () {
      // Arrange
      const offerCode = 'Unknown';

      // Act
      final discountPercentage = getDiscountPercentage(offerCode);

      // Assert
      expect(discountPercentage, 0.0);
    });
  });
}
