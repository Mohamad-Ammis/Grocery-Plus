import 'package:get/get.dart';
import '../pages/category.dart';
import '../pages/mybag_page.dart';
import '../pages/search_page/serach_page.dart';
import '../widgets/home_page_widgets/home_page_body.dart';

class NavigationController extends GetxController{
  int selectedIndex=0;
  List screens=[
    HomePageBody(),
    Category(),
    MybagPage(),
    SearchPage(),
  ];
}