import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/navigation_controller.dart';
import 'nav_bar_item.dart';

class CustomNavigationBar extends StatelessWidget {
  CustomNavigationBar({
    super.key,
  });
  final controller = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      clipBehavior: Clip.hardEdge,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32), topRight: Radius.circular(32)),
      ),
      child: NavigationBar(
        height: 116,
        elevation: 0,
        selectedIndex: controller.selectedIndex,
        destinations: [
          NavBarItem(
            index: 0,
            icon: Icons.home_outlined,
          ),
          NavBarItem(index: 1, icon: Icons.dashboard_outlined),
          NavBarItem(index: 2, icon: Icons.shopping_bag_outlined),
          NavBarItem(index: 3, icon: Icons.menu),
        ],
      ),
    );
  }
}
