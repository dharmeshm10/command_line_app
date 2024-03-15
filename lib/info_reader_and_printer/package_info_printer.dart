class PackagePrinter {
  /// Print inputted value
  void printDeliveryCostEstimation({
    required String pkgId,
    required double pkgWeight,
    required double distance,
    required String offerCode,
  }) {
    print("\n-===-=-=-= INPUT -===-=-=-=");
    print("Inputted Weight :: $pkgWeight kg");
    print("Inputted Distance :: $distance km");
    print("Inputted offerCode :: ${offerCode.toUpperCase()}");
    print('-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
  }

  /// Print inputted value
  void printPackageDetailsOfEstimateTime({
    required String pkgId,
    required double pkgWeight,
    required double distance,
    required String offerCode,
  }) {
    print('\n-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
    print("Inputted Weight :: $pkgWeight kg");
    print("Inputted Distance :: $distance km");

    //TODO:(Dharmesh) make offer optional WIP
    if (offerCode.isNotEmpty) {
      print("Inputted offerCode :: ${offerCode.toUpperCase()}");
    }
    print('-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
  }

  /// Print inputted value
  void printVehicleInfo({
    required int noOfVehicles,
    required double maxSpeed,
    required double maxCarriableWeight,
  }) {
    print("\n\n-===-=-=-= INPUT -===-=-=-=");
    print("NoOfVehicles :: $noOfVehicles");
    print("MaxSpeed :: $maxSpeed");
    print("MaxCarriableWeight :: $maxCarriableWeight");
    print('-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
  }

  void printDeliveryCost({
    required double totalCost,
  }) {
    print("\n\n-===-=-=-= OUTPUT -===-=-=-=");
    print("Delivery Cost :: $totalCost");
  }

  void printDiscount({
    required double discount,
    required double totalCost,
  }) {
    print(
        "${discount * 100} % Discount on Delivery cost :: ${discount > 0 ? "-${totalCost * discount}" : "$discount"}");
  }

  void printTotalCost({
    required String pkgId,
    required double totalCost,
  }) {
    print("Total Cost of pkgId==>$pkgId :: $totalCost");
    print('-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
  }

  /// Print inputted value
  void printEstimateTimeInfo({
    required String packageId,
    required String totalCost,
    required String estimatedDeliveryTime,
  }) {
    print("packageId :: $packageId");
    // print("totalCost :: $totalCost");
    print("estimatedDeliveryTime :: $estimatedDeliveryTime");
    print('-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
  }
}
