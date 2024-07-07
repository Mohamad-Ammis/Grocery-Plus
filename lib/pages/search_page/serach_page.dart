import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:task7_store_app/pages/search_page/search_bar.dart';
import 'package:task7_store_app/pages/search_page/search_card.dart';
import '../../controllers/search_controller.dart';
import '../../manager/transfer_data_cubit.dart';
import '../../models/product_model.dart';
import '../details_page.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final controller = Get.put(SearchPageController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const CustomSearchBar(),
          GetBuilder<SearchPageController>(builder: (controller) {
            return controller.visibleProducts.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      physics:const BouncingScrollPhysics(),
                        itemCount: controller.visibleProducts.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              List<Map<String, dynamic>>? data=ProductModel.data
                                (category:controller.visibleProducts[index].category);
                              BlocProvider.of<TransferDataCubit>(context).pushData(data:
                              data!, index: controller.visibleProducts[index].id);
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return   DetailsPage();//data: data[index],dataNoIndex: data
                              }));
                            },
                            child: SearchCard(
                              index: index,
                              data: ProductModel.data(category:controller.visibleProducts[index].category),
                                model: controller.visibleProducts[index]),
                          );
                        }),
                  )
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/empty_search.png'),
                          const Text(
                            'Opps! We can’t find your product! ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  );
          })
        ],
      ),
    );
  }
}
