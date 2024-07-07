import 'package:get/get.dart';
import '../models/home_card_model.dart';

class HomePageController extends GetxController {
  final homeProducts = [
    HomeCardModel(
        image: 'assets/images/fruits.png', title: 'Fruits & Vegetables'),
    HomeCardModel(image: 'assets/images/breakfast.png', title: 'Breakfast'),
    HomeCardModel(image: 'assets/images/Beverages.png', title: 'Beverages'),
    HomeCardModel(image: 'assets/images/meat.png', title: 'Meat & Fish'),
    HomeCardModel(image: 'assets/images/snaks.png', title: 'Snacks'),
    HomeCardModel(image: 'assets/images/dairy.png', title: 'Dairy'),
  ];
}
