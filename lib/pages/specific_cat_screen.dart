import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:task7_store_app/manager/transfer_data_cubit.dart';
import 'package:task7_store_app/pages/details_page.dart';
import 'package:task7_store_app/models/product_model.dart';
import 'mybag_page.dart';

List<Map<String,dynamic>>bag=[];
class SpecificCatScreen extends StatelessWidget {
   SpecificCatScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   // var categoryName=Get.find<SpecificCatController>().category;
  String category=BlocProvider.of<TransferDataCubit>(context).category!;
    List<Map<String, dynamic>>? data=ProductModel.data(category:category);
    return Scaffold(
      appBar:  AppBar(
        title: Text(category),//
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xffFFE4CF), Colors.white],
            ),
          ),
        ),
      ),
      body:   Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          physics:const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: MediaQuery.of(context).size.height * 0.00070,
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: () {
                BlocProvider.of<TransferDataCubit>(context).pushData(data: data, index: index);
                Navigator.push(context, MaterialPageRoute(builder: (context){
              return   DetailsPage();//data: data[index],dataNoIndex: data
                }));
              },
              child:Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color:  Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.network(
                                  data[index]['image'],
                                errorBuilder:(BuildContext context, Object error, StackTrace? stackTrace) =>
                                    Image.asset('images/Empty.png'),
                                fit: BoxFit.fill,
                                width: MediaQuery.of(context).size.width*0.25,
                                height: 100,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(5),
                      Text(data[index]['description'],
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      ),
                      const Gap(30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('${data[index]['price']}৳',style:const TextStyle(color: Colors.deepOrange),
                          ),
                        ],
                      ),
                     const Gap(10),
                      MaterialButton(onPressed: (){
                        if(bag.contains(data[index])){
                          ScaffoldMessenger.of(context).showSnackBar(
                          const  SnackBar(
                              content: Text('you have already added to your bag!',style: TextStyle(color: Colors.white),),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.orange,
                            ),
                          );
                        }
                       else {
                          bag.add(data[index]);
                          BlocProvider.of<TransferDataCubit>(context).pushToBag(
                              bag: bag);
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) {
                            return MybagPage();
                          }));
                        }
                      },
                        shape:const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12))
                        ),
                        height: 40,
                        minWidth: 164,
                        color:const Color(0xff5EC401),
                        child:const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_bag_outlined,color: Colors.white,),
                            Spacer(),
                            Text('Add To Bag',style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount:data!.length ,
        ),
      ),
    );
  }
}