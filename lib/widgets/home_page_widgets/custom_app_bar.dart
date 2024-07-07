import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/search_page/serach_page.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: const Text(
        "Grocery Plus",
        style: TextStyle(
            fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.w600),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Get.to(SearchPage());
            },
            icon: const Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
      ],
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
