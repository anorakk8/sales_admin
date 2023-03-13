// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_admin/app/routes/app_pages.dart';

class NavigationController extends GetxController {
  late List pages = [
    Routes.SALESPERSON_TRACKER,
  ];

  ScrollController newInvoiceScrollController = ScrollController();

  RxBool get isSideNavCollapsed => _isSideNavCollapsed;
  RxBool _isSideNavCollapsed = false.obs;

  RxBool isAnimationOver = false.obs;

  toggleSideNavSize() async {
    isAnimationOver(false);
    _isSideNavCollapsed.value = !_isSideNavCollapsed.value;
    await Future.delayed(Duration(milliseconds: 100));
    isAnimationOver(true);
  }

  navigateTo(int index) {
    Get.back();
    Get.toNamed(
      pages[index],
    );
  }

  void logOut() {
    Get.back();
    // Get.toNamed(
    //  pages[PageIndex.LOGIN],
    // );
  }
}

abstract class PageIndex {
  static const SALES_PERSON_TRACKER = 0;
}
