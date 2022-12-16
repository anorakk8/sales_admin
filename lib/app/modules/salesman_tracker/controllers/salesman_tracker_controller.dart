import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalesmanTrackerController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  RxList<City>? get citySearchList => _citySearchList;
  RxList<City>? _citySearchList =
      <City>[City(id: 1, name: 'Delhi'), City(id: 2, name: 'Bangalore')].obs;

  Rx<TextEditingController> get cityTextController => _cityTextController;
  Rx<TextEditingController> _cityTextController =
      TextEditingController(text: "").obs;

  List<City> getCitySuggestions(String pattern) {
    return List.of(_citySearchList!).where((city) {
      final cityLower = city.name?.toLowerCase();
      final patternLower = pattern.toLowerCase().trim();

      return cityLower!.contains(patternLower);
    }).toList();
  }

  void onCitySuggestionSelected(City? suggestion) {
    _cityTextController.value.text = suggestion?.name ?? '';
  }
}

class City {
  int? id;
  String? name;

  City({this.id, this.name});
}
