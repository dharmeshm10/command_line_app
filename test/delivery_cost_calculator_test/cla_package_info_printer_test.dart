import 'package:command_line_app/delivery_cost_calculator/cla_package_info_printer.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

class MockPackagePrinter extends Mock implements PackagePrinter {}

void main() {
  group('Test PackagePrinter', () {
    test('Print Package Details', () {
      final mockPrinter = MockPackagePrinter();

      mockPrinter.printPackageDetails(
        pkgId: 'PKG001',
        pkgWeight: 5.0,
        distance: 10.0,
        offerCode: 'OFR001',
      );

      verify(mockPrinter.printPackageDetails(
        pkgId: 'PKG001',
        pkgWeight: 5.0,
        distance: 10.0,
        offerCode: 'OFR001',
      )).called(1);
    });

    test('Test Print Delivery Cost', () {
      final mockPrinter = MockPackagePrinter();

      mockPrinter.printDeliveryCost(totalCost: 100.0);

      verify(mockPrinter.printDeliveryCost(totalCost: 100.0)).called(1);
    });

    test('Test Print Discount', () {
      final mockPrinter = MockPackagePrinter();

      mockPrinter.printDiscount(discount: 0.1, totalCost: 100.0);

      verify(mockPrinter.printDiscount(discount: 0.1, totalCost: 100.0))
          .called(1);
    });

    test('Test Print Total Cost', () {
      final mockPrinter = MockPackagePrinter();

      mockPrinter.printTotalCost(pkgId: 'PKG001', totalCost: 100.0);

      verify(mockPrinter.printTotalCost(pkgId: 'PKG001', totalCost: 100.0))
          .called(1);
    });
  });
}
