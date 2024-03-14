class PackagePrinter {
  /// Print inputted value
  void printPackageDetails({
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
    print('\n-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
    print("Inputted noOfVehicles :: $noOfVehicles");
    print("Inputted maxSpeed :: $maxSpeed");
    print("Inputted maxCarriableWeight :: $maxCarriableWeight");
    print('-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
  }

  void printDeliveryCost({
    required double totalCost,
  }) {
    print("Delivery Cost :: $totalCost");
    print('-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
  }

  void printDiscount({
    required double discount,
    required double totalCost,
  }) {
    print(
        "${discount * 100} % Discount on Delivery cost :: ${discount > 0 ? "-${totalCost * discount}" : "$discount"}");
    print('-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
  }

  void printTotalCost({
    required String pkgId,
    required double totalCost,
  }) {
    print("Total Cost of pkgId==>$pkgId :: $totalCost");
    print('-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
  }
}
