import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:task7_store_app/controllers/search_controller.dart';
import '../../controllers/home_page_controller.dart';
import '../../manager/transfer_data_cubit.dart';
import '../../pages/specific_cat_screen.dart';
import 'home_card.dart';

class HomeProductsList extends StatelessWidget {
  HomeProductsList({
    super.key,
  });
  final controller=Get.put(HomePageController());
  List<List> categories=[['assets/images/fruit.png','Fruits&Vegetables'],
    ['assets/images/breakfast.jpg','Breakfast'],
    ['assets/images/beverages.jpg','Beverages'],
    ['assets/images/meat.jpg','Meat&Fish'],
    ['assets/images/snacks.png','Snacks'],
    ['assets/images/milk.png','Dairy'],
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 16),
      child: GridView.builder(
        physics:const BouncingScrollPhysics(),
        itemCount: controller.homeProducts.length,
          gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)),
                  child: GestureDetector(
                      onTap: (){
                        BlocProvider.of<TransferDataCubit>(context).pushCategory(category:categories[index][1]);
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return SpecificCatScreen();
                        }));
                      },
                      child: HomeCard(model: controller.homeProducts[index],)),
            );
          }),
    );
  }
}
