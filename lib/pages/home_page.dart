import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/navigation_controller.dart';
import '../widgets/home_page_widgets/custom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: CustomNavigationBar(),
        backgroundColor: const Color(0xFFF3F4F6),
        body: controller.screens[controller.selectedIndex],
      );
    });
  }
}