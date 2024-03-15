import 'package:command_line_app/delivery_cost_calculator/cla_package_info_printer.dart';
import 'package:command_line_app/delivery_cost_calculator/cla_package_info_reader.dart';
import 'package:command_line_app/delivery_cost_calculator/delivery_cost/delivery_cost.dart';
import 'package:mockito/mockito.dart';

class MockDeliveryCost extends Mock implements DeliveryCost {}
class MockPackagePrinter extends Mock implements PackagePrinter {}
class MockPackageInfoReader extends Mock implements PackageInfoReader {}