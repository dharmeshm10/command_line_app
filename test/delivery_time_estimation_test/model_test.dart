import 'package:command_line_app/delivery_time_estimation/estimate_time/model.dart';
import 'package:test/test.dart';

void main() {
  test('Vehicle currentLoad calculation', () {
    Vehicle vehicle = Vehicle(100, 50); // Max weight: 100 kg, Speed: 50 km/hr

    // Add packages to the vehicle
    vehicle.packages.add(Package('1', 20, 10, 'A')); // Weight: 20 kg
    vehicle.packages.add(Package('2', 80, 15, 'B')); // Weight: 30 kg
    vehicle.packages.add(Package('3', 40, 20, 'C')); // Weight: 40 kg

    // Calculate current load
    double currentLoad = vehicle.currentLoad;

    // Assert the current load is correct
    expect(currentLoad, equals(140)); // 20 + 80 + 40 = 140 kg
  });
}
