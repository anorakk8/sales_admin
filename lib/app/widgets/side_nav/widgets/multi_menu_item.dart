import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_admin/app/widgets/side_nav/controller/navigation_controller.dart';

class MultiMenuItem extends StatefulWidget {
  MultiMenuItem({
    required this.title,
    required this.iconData,
    required List<Map<String, int>> this.children,
  });

  final String title;
  final List<Map<String, int>> children;
  final IconData iconData;

  @override
  State<MultiMenuItem> createState() => _MultiMenuItemState();
}

class _MultiMenuItemState extends State<MultiMenuItem>
    with TickerProviderStateMixin {
  bool isExpanded = false;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.bounceOut,
  );

  initState() {
    isExpanded = false;
  }

  @override
  Widget build(BuildContext context) {
    NavigationController controller = Get.put(NavigationController());
    Widget titleWidget =
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
        child: Row(
          children: [
            Icon(widget.iconData),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: SizeTransition(
                      sizeFactor: _animation,
                      axis: Axis.horizontal,
                      child: Text(
                        widget.title,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      IconButton(
          onPressed: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          icon: Icon(isExpanded
              ? Icons.expand_less_rounded
              : Icons.expand_more_rounded))
    ]);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleWidget,
          Visibility(
            visible: isExpanded,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                children: widget.children
                    .map((item) => MenuItem(
                        leading: Icon(Icons.chevron_right_rounded),
                        title: Text(
                          widget.children.first.keys.first,
                        ),
                        selected: true,
                        onTap: () => controller
                            .navigateTo(widget.children.first.values.first)))
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MenuItem extends StatefulWidget {
  MenuItem(
      {required this.leading,
      required this.selected,
      required this.title,
      required this.onTap});

  final Widget title;
  final bool selected;
  final Widget? leading;
  final void Function() onTap;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap,
      child: Row(
        children: [
          widget.leading!,
          widget.title,
        ],
      ),
    );
  }
}
