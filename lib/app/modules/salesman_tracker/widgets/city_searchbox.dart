import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:sales_admin/app/constants/fonts.dart';
import 'package:sales_admin/app/modules/salesman_tracker/controllers/salesman_tracker_controller.dart';

SalesmanTrackerController _controller = Get.put(SalesmanTrackerController());

class FilterBarSalesmanTracker extends StatelessWidget {
  const FilterBarSalesmanTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        searchBox,
        SizedBox(
          width: 10,
          height: 0,
        ),
        Row(
          children: [
            filterButton,
            SizedBox(
              width: 10,
              height: 0,
            ),
            resetButton,
          ],
        )
      ],
    );
  }

//SEARCHBOX

  static Widget searchBox = SizedBox(
    width: 200,
    height: 38,
    child: Obx(
      () => TypeAheadField<City>(
        suggestionsBoxDecoration: const SuggestionsBoxDecoration(
            constraints: BoxConstraints.tightFor(width: 200, height: 200)),
        textFieldConfiguration: TextFieldConfiguration(
            controller: _controller.cityTextController.value,
            style: Fonts.H3,
            decoration: InputDecoration(
                isDense: true,
                prefixIcon: const Icon(
                  Icons.search,
                ),
                label: Text(
                  "City",
                  style: Fonts.H3,
                ),
                border: const OutlineInputBorder())),
        suggestionsCallback: _controller.getCitySuggestions,
        itemBuilder: (context, City? suggestion) {
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${suggestion?.name}',
                  style: Fonts.H3,
                ),
              ],
            ),
          );
        },
        onSuggestionSelected: (City? suggestion) async {
          _controller.onCitySuggestionSelected(suggestion);
        },
        noItemsFoundBuilder: (context) => const ListTile(
          title: Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              "No matches found",
              textAlign: TextAlign.center,
              textScaleFactor: 0.85,
            ),
          ),
        ),
      ),
    ),
  );

//FILTER

  static Widget resetButton = ElevatedButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        elevation: MaterialStateProperty.all(3),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: const BorderSide(color: Colors.red)))),
    child: const Text(
      'Reset',
      style: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w200, color: Colors.red),
    ),
    onPressed: () {
      // imtVm.resetData();
    },
  );

//RESET

  static Widget filterButton = ElevatedButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.green),
        elevation: MaterialStateProperty.all(3),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ))),
    child: const Text(
      'Search',
      style: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w200, color: Colors.white),
    ),
    onPressed: () {
      // imtVm.filterData();
    },
  );
}
