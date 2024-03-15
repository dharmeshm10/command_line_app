import 'package:command_line_app/delivery_time_estimation/estimate_time/model.dart';

class MockDeliveryCostCalculator {
  double calculateCost(double baseCost, Package package) {
    double discount = 0; // Calculate discount based on offer code
    return baseCost + package.weight * package.distance + discount;
  }
}
