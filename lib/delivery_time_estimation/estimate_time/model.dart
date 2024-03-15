/// Temporary we can have separate class as do not have proper structure
class Package {
  final String id;
  final double weight;
  final double distance;
  final String offerCode;

  Package(this.id, this.weight, this.distance, this.offerCode);
}

class Vehicle {
  final double maxWeight;
  final double speed;
  List<Package> packages = [];

  Vehicle(
    this.maxWeight,
    this.speed,
  );

  double get currentLoad => packages.fold(
        0,
        (prev, package) => prev + package.weight,
      );
}
