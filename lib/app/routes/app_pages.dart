import 'package:get/get.dart';
import 'package:sales_admin/app/modules/salesman_tracker/views/salesman_tracker_view.dart';

import '../modules/salesman_tracker/bindings/salesman_tracker_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SALESPERSON_TRACKER;

  static final routes = [
    GetPage(
      name: _Paths.SALESPERSON_TRACKER,
      page: () => SalesmanTrackerView(),
      binding: SalesmanTrackerBinding(),
    ),
  ];
}
