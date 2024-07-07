import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/navigation_controller.dart';


class NavBarItem extends StatelessWidget {
  NavBarItem({
    super.key, required this.index, required this.icon,
  });
  final controller=Get.put(NavigationController());
  final int index;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.selectedIndex = index;
        controller.update();
      },
      child: CircleAvatar(
        radius: 28,
        backgroundColor: controller.selectedIndex == index
            ? const Color(0xFF5EC401)
            : Colors.transparent,
        child: Icon(icon,color: controller.selectedIndex==index?Colors.white:Colors.black,),
      ),
    );
  }
}
