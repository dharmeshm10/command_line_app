import 'package:command_line_app/delivery_time_estimation/estimate_time/model.dart';
import 'package:test/test.dart';
import '__mock__/mock.dart';

void main() {
  group('Delivery Time Estimation Test', () {
    late List<Package> packages;
    late MockDeliveryCostCalculator costCalculator;

    setUp(() {
      packages = [];
      costCalculator = MockDeliveryCostCalculator();
    });

    test('Calculate estimated delivery time', () {
      List<Vehicle> vehicles = List.generate(2, (_) => Vehicle(100, 50));

      // Add packages to the vehicles
      vehicles[0].packages.add(Package('1', 20, 10, 'A'));
      vehicles[1].packages.add(Package('2', 30, 15, 'B'));

      // Calculate estimated delivery time
      for (Vehicle vehicle in vehicles) {
        for (Package package in vehicle.packages) {
          double totalCost = costCalculator.calculateCost(
              50, package); // Assuming base cost is 50
          double estimatedDeliveryTime = package.distance / vehicle.speed;
          print(
              'Package ID: ${package.id}, Total Cost: $totalCost, Estimated Delivery Time: $estimatedDeliveryTime');
          expect(estimatedDeliveryTime, greaterThan(0));
        }
      }
    });

    /// Cleanup
    tearDown(() {
      packages.clear();
    });
  });
}
