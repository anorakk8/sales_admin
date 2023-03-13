import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_admin/app/constants/ui.dart';
import 'package:sales_admin/app/widgets/side_nav/controller/navigation_controller.dart';
import 'package:sales_admin/app/widgets/side_nav/widgets/multi_menu_item.dart';

class SideNav extends GetView<NavigationController> {
  final int selectedIndex;

  SideNav(this.selectedIndex);

  final double _collapsedWidth = 55;
  final double _expandedWidth = 200;

  @override
  Widget build(BuildContext context) {
    NavigationController controller = Get.put(NavigationController());

    return Obx(
      () => AnimatedContainer(
        curve: controller.isSideNavCollapsed.value
            ? Curves.easeOutSine
            : Curves.easeInSine,
        // onEnd: () {
        //   !controller.isSideNavCollapsed.value
        //       ? controller.isAnimationOver(true)
        //       : controller.isAnimationOver(false);
        // },
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            border: Border(right: BorderSide(color: Colors.grey.shade500))),
        // height: 800,
        width: controller.isSideNavCollapsed.value
            ? _collapsedWidth
            : _expandedWidth,
        duration: const Duration(milliseconds: 200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  _navMultiItem(
                      iconSelected: Icons.inventory_2,
                      iconUnselected: Icons.inventory_2_outlined,
                      title: "Salesperson Manager",
                      subItemTitleIndex: [
                        {'Track Shifts': PageIndex.SALES_PERSON_TRACKER},
                        {'Track Shifts': PageIndex.SALES_PERSON_TRACKER},
                        {'Track Shifts': PageIndex.SALES_PERSON_TRACKER},
                      ]),
                  _navMultiItem(
                      iconSelected: Icons.inventory_2,
                      iconUnselected: Icons.inventory_2_outlined,
                      title: "Salesperson Manager",
                      subItemTitleIndex: [
                        {'Track Shifts': PageIndex.SALES_PERSON_TRACKER},
                        {'Track Shifts': PageIndex.SALES_PERSON_TRACKER},
                        {'Track Shifts': PageIndex.SALES_PERSON_TRACKER},
                      ]),
                  _navMultiItem(
                      iconSelected: Icons.inventory_2,
                      iconUnselected: Icons.inventory_2_outlined,
                      title: "Salesperson Manager",
                      subItemTitleIndex: [
                        {'Track Shifts': PageIndex.SALES_PERSON_TRACKER},
                        {'Track Shifts': PageIndex.SALES_PERSON_TRACKER},
                        {'Track Shifts': PageIndex.SALES_PERSON_TRACKER},
                      ]),
                  _navMultiItem(
                      iconSelected: Icons.inventory_2,
                      iconUnselected: Icons.inventory_2_outlined,
                      title: "Salesperson Manager",
                      subItemTitleIndex: [
                        {'Track Shifts': PageIndex.SALES_PERSON_TRACKER},
                        {'Track Shifts': PageIndex.SALES_PERSON_TRACKER},
                        {'Track Shifts': PageIndex.SALES_PERSON_TRACKER},
                      ]),
                  _navMultiItem(
                      iconSelected: Icons.inventory_2,
                      iconUnselected: Icons.inventory_2_outlined,
                      title: "Salesperson Manager",
                      subItemTitleIndex: [
                        {'Track Shifts': PageIndex.SALES_PERSON_TRACKER},
                        {'Track Shifts': PageIndex.SALES_PERSON_TRACKER},
                        {'Track Shifts': PageIndex.SALES_PERSON_TRACKER},
                      ]),
                  _navMultiItem(
                      iconSelected: Icons.inventory_2,
                      iconUnselected: Icons.inventory_2_outlined,
                      title: "Salesperson Manager",
                      subItemTitleIndex: [
                        {'Track Shifts': PageIndex.SALES_PERSON_TRACKER},
                        {'Track Shifts': PageIndex.SALES_PERSON_TRACKER},
                        {'Track Shifts': PageIndex.SALES_PERSON_TRACKER},
                      ]),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                    width: controller.isSideNavCollapsed.value
                        ? _collapsedWidth
                        : _expandedWidth,
                    child: Divider(
                      color: Colors.grey.shade400,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.toggleSideNavSize();
                      },
                      icon: Icon(controller.isSideNavCollapsed.value
                          ? Icons.chevron_right
                          : Icons.chevron_left),
                      splashRadius: 22,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _navItem(
          {required IconData? iconSelected,
          required IconData? iconUnselected,
          required String? title,
          required final VoidCallback onTap,
          bool selected = false}) =>
      controller.isSideNavCollapsed.value
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: IconButton(
                splashRadius: 20,
                onPressed: onTap,
                icon: selected
                    ? Icon(iconSelected, color: UI.colour.PRIMARY)
                    : Icon(
                        iconUnselected,
                        color: Colors.black,
                      ),
              ),
            )
          : MenuItem(
              leading: selected
                  ? SizedBox(
                      width: 50,
                      child: Icon(iconSelected, color: UI.colour.PRIMARY))
                  : SizedBox(
                      width: 50,
                      child: Icon(
                        iconUnselected,
                        color: Colors.black,
                      ),
                    ),
              title: Visibility(
                visible: !controller.isSideNavCollapsed.value,
                child: Text(
                  '$title',
                  style: UI.font.H,
                ),
              ),
              selected: selected,
              onTap: onTap,
            );

  Widget _navMultiItem(
      {required IconData? iconSelected,
      required IconData? iconUnselected,
      required String title,
      required List<Map<String, int>> subItemTitleIndex}) {
    List<Widget> children = [];

    for (int i = 0; i < subItemTitleIndex.length; i++) {
      assert(subItemTitleIndex[i].length == 1);

      children.add(
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: DecoratedBox(
            decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal:
                        BorderSide(color: Colors.grey.shade300, width: 0))),
            child: _navItem(
                selected: selectedIndex == subItemTitleIndex[i].values.first,
                iconSelected: Icons.chevron_right,
                iconUnselected: Icons.chevron_right,
                title: subItemTitleIndex[i].keys.first,
                onTap: () => navigateTo(subItemTitleIndex[i].values.first)),
          ),
        ),
      );
    }

    return controller.isSideNavCollapsed.value
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              color: subItemTitleIndex
                      .any((element) => element.values.contains(selectedIndex))
                  ? UI.colour.BACKGROUND
                  : Colors.transparent,
              child: IconButton(
                splashRadius: 22,
                icon: subItemTitleIndex.any(
                        (element) => element.values.contains(selectedIndex))
                    ? Icon(iconSelected, color: UI.colour.PRIMARY)
                    : Icon(
                        iconUnselected,
                        color: Colors.black,
                      ),
                onPressed: () {
                  controller.toggleSideNavSize();
                  controller.navigateTo(subItemTitleIndex.first.values.first);
                },
              ),
            ),
          )
        : MultiMenuItem(
            iconData: iconSelected!,
            title: title,
            children: subItemTitleIndex,
          );
  }

  void navigateTo(int index) {
    controller.navigateTo(index);
  }
}
