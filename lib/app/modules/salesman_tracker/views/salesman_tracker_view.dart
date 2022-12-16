import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sales_admin/app/constants/colours.dart';
import 'package:sales_admin/app/constants/fonts.dart';
import 'package:sales_admin/app/modules/salesman_tracker/widgets/city_searchbox.dart';

import 'package:sales_admin/app/utils/sidenav.dart';

import '../controllers/salesman_tracker_controller.dart';

class SalesmanTrackerView extends GetView<SalesmanTrackerController> {
  SalesmanTrackerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('HomeView'),
        //   centerTitle: true,
        // ),
        body: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SideNav(),
      Expanded(
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colours.LIGHT_GREY))),
                  height: 63.5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: FilterBarSalesmanTracker(),
                  ),
                ),
              )
            ],
          )
        ]),
      )
    ]));
  }
}
