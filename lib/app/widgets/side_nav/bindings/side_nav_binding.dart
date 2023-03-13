import 'package:get/get.dart';
import 'package:sales_admin/app/widgets/side_nav/controller/navigation_controller.dart';
import 'package:sales_admin/app/widgets/side_nav/view/side_nav.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(
      () => NavigationController(),
    );
  }
}
