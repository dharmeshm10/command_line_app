import 'package:test/test.dart';
import 'package:command_line_app/delivery_cost_calculator/delivery_cost/delivery_cost.dart';

void main() {
  group('DeliveryCostCalculator', () {
    test('Calculate delivery cost with different values', () {
      final calculator = DeliveryCost();

      // Test with baseDeliveryCost = 50, pkgWeight = 3, distance = 20
      final totalCost1 = calculator.calculateDeliveryCost(
        baseDeliveryCost: 50.0,
        pkgWeight: 3.0,
        distance: 20.0,
      );
      expect(totalCost1, 50.0 + (3.0 * 10) + (20.0 * 5));

      // Test with baseDeliveryCost = 75, pkgWeight = 5, distance = 15
      final totalCost2 = calculator.calculateDeliveryCost(
        baseDeliveryCost: 75.0,
        pkgWeight: 5.0,
        distance: 15.0,
      );
      expect(totalCost2, 75.0 + (5.0 * 10) + (15.0 * 5));
    });

    test('Calculate delivery cost with zero values', () {
      final calculator = DeliveryCost();

      // Test with baseDeliveryCost = 0, pkgWeight = 0, distance = 0
      final totalCost = calculator.calculateDeliveryCost(
        baseDeliveryCost: 0.0,
        pkgWeight: 0.0,
        distance: 0.0,
      );
      expect(totalCost, 0.0);
    });

    test('Calculate delivery cost with negative values', () {
      final calculator = DeliveryCost();

      // Test with baseDeliveryCost = -50, pkgWeight = -3, distance = -20
      expect(
        () => calculator.calculateDeliveryCost(
          baseDeliveryCost: -50.0,
          pkgWeight: -3.0,
          distance: -20.0,
        ),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
