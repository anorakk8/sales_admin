import 'package:flutter/material.dart';
import 'package:sales_admin/app/constants/colours.dart';
import 'package:sales_admin/app/constants/fonts.dart';
import 'package:sidebarx/sidebarx.dart';

class SideNav extends StatelessWidget {
  SideNav({super.key});

  final sidebarController =
      SidebarXController(selectedIndex: 0, extended: true);
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      // headerBuilder: (context, extended) => extended
      //     ? Padding(
      //         padding: const EdgeInsets.all(15),
      //         child: Text('COMPANY LOGO'),
      //       )
      //          : SizedBox.shrink(),
      animationDuration: const Duration(milliseconds: 100),
      controller: sidebarController,
      separatorBuilder: (context, index) => Container(
        height: 1,
        color: Colours.LIGHT_GREY,
      ),
      items: const [
        SidebarXItem(
          icon: Icons.person_search,
          label: 'Salesman Tracker',
        ),
        SidebarXItem(icon: Icons.list_alt_outlined, label: 'Orders'),
        SidebarXItem(icon: Icons.payments_outlined, label: 'Payments'),
        SidebarXItem(icon: Icons.storage_outlined, label: 'Edit Database'),
        SidebarXItem(icon: Icons.summarize_outlined, label: 'Reports'),
      ],
      theme: SidebarXTheme(
          decoration: BoxDecoration(
              border: Border(right: BorderSide(color: Colours.LIGHT_GREY))),
          hoverColor: Colours.LIGHT_GREY,
          itemDecoration:
              BoxDecoration(border: Border.all(color: Colors.transparent)),
          selectedIconTheme: IconThemeData(color: Colours.PRIMARY)),
      extendedTheme: SidebarXTheme(
          textStyle: Fonts.H2,
          selectedTextStyle: Fonts.H2,
          decoration: BoxDecoration(
              border: Border(right: BorderSide(color: Colours.LIGHT_GREY))),
          width: 200,
          itemTextPadding: const EdgeInsets.only(left: 14),
          selectedItemTextPadding: const EdgeInsets.only(left: 14),
          selectedItemPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          itemPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          selectedItemDecoration: BoxDecoration(color: Colours.LIGHT_GREY)),
    );
  }
}
