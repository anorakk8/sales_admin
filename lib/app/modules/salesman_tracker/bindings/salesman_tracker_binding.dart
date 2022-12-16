import 'package:get/get.dart';

import '../controllers/salesman_tracker_controller.dart';

class SalesmanTrackerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SalesmanTrackerController>(
      () => SalesmanTrackerController(),
    );
  }
}
