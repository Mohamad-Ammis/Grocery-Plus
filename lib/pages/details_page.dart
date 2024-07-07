import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:task7_store_app/manager/transfer_data_cubit.dart';
import 'package:task7_store_app/pages/mybag_page.dart';
import 'package:task7_store_app/pages/specific_cat_screen.dart';
import '../widgets/other_products.dart';

class DetailsPage extends StatelessWidget{
   DetailsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int index1=BlocProvider.of<TransferDataCubit>(context).index!;
    List<dynamic> data=BlocProvider.of<TransferDataCubit>(context).data!;
    return Scaffold(
      appBar:  AppBar(
        title:const Text('Product Details'),
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
      backgroundColor:const Color(0xffFFF7FC),
      body: SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
            Container(
              height: 308,
              width: 294,
            decoration:const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
              child: Center(
           child:Image.network('${data[index1]['image']}',
           errorBuilder:(BuildContext context, Object error, StackTrace? stackTrace) =>
                  Image.asset('images/Empty.png'),
           ) ,
              ),
            ),
             const Gap(15),
              Row(children: [
                Container(
                  height: 66,
                  width: 66,
                  decoration:const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Center(
                    child: Image.network(data[index1]['image'],
                      errorBuilder:(BuildContext context, Object error, StackTrace? stackTrace) =>
                          Image.asset('images/Empty.png'),
                    ),
                  ),
                ),
              const  Gap(6),
                Container(
                  height: 66,
                  width: 66,
                  decoration:const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Center(
                    child: Image.network(data[index1]['image'],
                      errorBuilder:(BuildContext context, Object error, StackTrace? stackTrace) =>
                          Image.asset('images/Empty.png'),
                    ),
                  ),
                ),
              ],),
            const  Gap(10),
              Text(data[index1]['description'],style:const TextStyle(fontSize: 18,),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
           const  Gap(8),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Text('${data[index1]['amount']}${data[index1]['unit']}',style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                const Spacer(),
                 Text('${data[index1]['price']}৳',style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.lightGreen),),
               ],
             ),
            const  Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(data[index1]['category'],style:const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                ],
              ),
             const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('${data[index1]['title']}',
                  overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            const  Gap(25),
           const   Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('You can also check this items',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),),
                ],
              ),
            const  Gap(20),
              OtherProducts(data: data,dataIndex: data[index1]),
              MaterialButton(onPressed: (){
                if(bag.contains(data[index1])){
                 ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content:const Text('you have already added'),backgroundColor: Colors.orange,
                        action: SnackBarAction(
                          label: 'back',
                          textColor: Colors.white,
                          onPressed: (){},
                    )));
                }
                else {
                  bag.add(data[index1]);
                  BlocProvider.of<TransferDataCubit>(context).pushToBag(
                      bag: bag);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MybagPage();
                  }));
                }
              },
                shape:const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))
                ),
                height: 48,
                minWidth: 343,
                color:const Color(0xff5EC401),
                child:const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Text('Add To Bag',style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                    textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    Icon(Icons.shopping_bag_outlined,color: Colors.white,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
