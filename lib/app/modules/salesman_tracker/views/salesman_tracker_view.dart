import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sales_admin/app/widgets/data_table/custom_data_table.dart';
import 'package:sales_admin/app/widgets/side_nav/controller/navigation_controller.dart';
import 'package:sales_admin/app/widgets/side_nav/view/side_nav.dart';

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
      SideNav(PageIndex.SALES_PERSON_TRACKER),
      Expanded(
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: CustomDataTable(data: {
                  'ID': salesmen.map((e) => e.id).toList(),
                  'Name': salesmen.map((e) => e.name).toList(),
                }, onRowSelect: (index) => () {}, onRowEdit: (index) => () {}),
              )
            ],
          )
        ]),
      )
    ]));
  }
}

class Salesman {
  String id;
  String name;
  int salesAmount;

  Salesman({required this.id, required this.name, required this.salesAmount});
}

List<Salesman> salesmen = [
  Salesman(id: 'BLR1', name: "John", salesAmount: 30000),
  Salesman(id: 'DL3', name: "Maggi", salesAmount: 45000)
];
