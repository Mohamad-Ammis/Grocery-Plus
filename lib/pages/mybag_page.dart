import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:task7_store_app/manager/transfer_data_cubit.dart';
import 'package:task7_store_app/pages/home_page.dart';
import 'package:task7_store_app/pages/specific_cat_screen.dart';
import 'package:task7_store_app/widgets/date_picker.dart';
import 'package:task7_store_app/widgets/mybag_products.dart';
import '../widgets/select_time.dart';

class MybagPage extends StatelessWidget {
   MybagPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int subPayment= BlocProvider.of<TransferDataCubit>(context).totalPayment??0;
   int totalPayment= subPayment+50;
    List<Map>?bag=BlocProvider.of<TransferDataCubit>(context).bag;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace:  Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xffFFE4CF), Colors.white],
            ),
          ),
        ),
        title:const  Text('My Bag',style: TextStyle(fontSize: 18,
            fontWeight: FontWeight.bold
        ),),
      ),
      backgroundColor: Colors.white,
    body: BlocBuilder<TransferDataCubit, TransferDataState>(
  builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const  Gap(10),
          const    Row(
              children: [
                Gap(15),
                Text('products',style: TextStyle(fontSize: 18),),
              ],
            ),
        const  Gap(10),
         MyBagProducts(bag: bag,),
            MaterialButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
             return HomePage();
            }));
            },
              shape:const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))
              ),
              height: 48,
              minWidth: 343,
              color:Colors.white70,
              child:const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Text('Add More Product',style: TextStyle(
                    color: Color(0xff5EC401),
                    fontSize: 18,
                  ),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  Icon(Icons.shopping_bag_outlined,color: Color(0xff5EC401),),
                ],
              ),
            ),
           const Gap(25),
          const  Text('Expected Date & TIme',style: TextStyle(
              fontSize: 18
            ),),
           const Gap(15),
           const DatePicker(),
           const   Gap(20),
           const SelectTime(),
           const  Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             const Text('Delivery Location',style: TextStyle(
                fontSize: 18
              ),),
            const  Spacer(),
              TextButton(child:const Text('Change',style: TextStyle(
                  color: Colors.green,
                  fontSize: 18
              ),
              ) ,onPressed: (){},),

            ],
          ),
         const   Gap(10),
         const  Row(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Icon(Icons.place_outlined),
               Gap(8),
               Expanded(
                 child: Text('Floor 4, Wakil Tower, Ta 131 Gulshan Badda Link Road',style: TextStyle(
                   color: Colors.black
                 ),),
               )
             ],
           ),
           const Gap(20),
            Padding(
             padding:  EdgeInsets.all(8.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Text('Subtotal'),
                 Spacer(),
                 Text('BDT${BlocProvider.of<TransferDataCubit>(context).totalPayment}')
               ],
             ),
           ),
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Delivery Charge'),
                  Spacer(),
                  Text('BDT50'),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const  Text('Total'),
                  const   Spacer(),
                  Text('BDT${(BlocProvider.of<TransferDataCubit>(context).totalPayment??0)+50}')
                ],
              ),
            ),
           const Gap(20),
          const  Text('Payment Methode'),
           const Gap(10),
            MaterialButton(onPressed: (){},
            child: Container(
              height: 85,
              width: 365,
              decoration:const BoxDecoration(
                color: Color(0xffC5EBAA),
                borderRadius: BorderRadius.all(Radius.circular(12))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
               const   Gap(5),
                Container(
                  height: 38,
                  width: 38,
                  decoration:const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff5EC401)
                  ),
                  child:const Icon(Icons.euro_outlined)
                ),
                 const Gap(5),
                 const Expanded(child: Text('Tap Here to select your Payment Method',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  maxLines: 2,
                  )),
               const   Icon(Icons.arrow_forward_ios_outlined),
                ],
              ),
            ),
            ),
          const  Gap(25),
            MaterialButton(onPressed: (){},
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
                  Text('Place Order',style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
                ],
              ),
            ),
           const Gap(10),
          ],
        ),
      ),
    );
  },
),
    );
  }
}
