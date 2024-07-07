import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:task7_store_app/manager/transfer_data_cubit.dart';

class MyBagProducts extends StatefulWidget {
   MyBagProducts({Key? key,this.bag}) : super(key: key);
List<Map> ?bag=[];
  @override
  State<MyBagProducts> createState() => _MyBagProductsState();
}
class _MyBagProductsState extends State<MyBagProducts>{

  // int totalPrice=0;
  // void calculateTotalPrice() {
  //   int total = 0;
  //   if (widget.bag != null) {
  //     for (int i = 0; i < widget.bag!.length; i++) {
  //       int originalAmount = widget.bag![i]['originalamount'];
  //       int newAmount = widget.bag![i]['amount'];
  //       int paymentRes = newAmount ~/ originalAmount;
  //       total+= (widget.bag![i]['price'] as int) * paymentRes;
  //     }
  //   }
  //   setState(() {
  //     totalPrice = total;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return widget.bag!=null? SizedBox(
      width: 376,
      height: 200,
      child: ListView.separated(
          shrinkWrap: false,
          physics:const BouncingScrollPhysics(),
          itemBuilder: (context,index){
            int originalAmount=widget.bag![index]['originalamount'];
            int newAmount=widget.bag![index]['amount'];
            int paymentRes=newAmount~/originalAmount;
            int totalPayment=0;
            //Map<int, int> paymentMap = {};
            for (int i = 0; i < widget.bag!.length; i++) {
              int price = widget.bag![i]['price'] as int;
              int originalAmount = widget.bag![i]['originalamount'];
              int newAmount = widget.bag![i]['amount'];
              int paymentRes = newAmount ~/ originalAmount;
              totalPayment += price * paymentRes;
            }
            BlocProvider.of<TransferDataCubit>(context).pushPayment(totalPayment: totalPayment);
            return SizedBox(width: 376,
              height: 164,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(image: NetworkImage(widget.bag![index]['image'],),
                      errorBuilder:(BuildContext context, Object error, StackTrace? stackTrace) =>
                          Image.asset('assets/images/Empty.png'),
                    height: 121,
                      width: 115,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(widget.bag![index]['description'],
                            maxLines: 2,
                            style:const TextStyle(fontSize:18),
                          ),
                        const  Gap(10),
                        const  Row(
                            children: [
                              Text('৳342',style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  decoration: TextDecoration.lineThrough
                              ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('৳${widget.bag![index]['price']*paymentRes}',style:const TextStyle(
                                fontSize: 22,
                                color: Colors.orange,
                              ),
                              ),
                            const  Gap(9),
                              Row(
                                children: [
                                  Container(
                                    height: 35,
                                    width: 35,
                                    decoration:const BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(Radius.circular(12))
                                    ),
                                    child: TextButton(onPressed: (){
                                      if(widget.bag![index]['amount']>1&&widget.bag![index]['unit']!="g") {
                                        widget.bag![index]['amount']--;

                                        setState(() {});
                                      }
                                      else if(widget.bag![index]['unit']=="g"&&widget.bag![index]['amount']>originalAmount){
                                        widget.bag![index]['amount']-=originalAmount;
                                        setState(() {});
                                      }
                                      else{}
                                    }, child:const Text('-',),
                                    ),
                                  ),
                                  Gap(MediaQuery.of(context).size.width*0.03),
                                  Text(widget.bag![index]['amount'].toString()),
                                  Gap(MediaQuery.of(context).size.width*0.03),
                                  Container(
                                    height: 35,
                                    width: 35,
                                    decoration:const BoxDecoration(
                                        color: Color(0xff5EC401),
                                        borderRadius: BorderRadius.all(Radius.circular(12))
                                    ),
                                    child: TextButton(onPressed: (){
                                      if(widget.bag![index]['unit']=="g"){
                                        widget.bag![index]['amount'] += originalAmount;
                                         setState(() {});
                                      }
                                      else{
                                        widget.bag![index]['amount']++;
                                       setState(() {});
                                      }
                                    }, child:const Text('+',),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context,index){return Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey,
          );
          },
          itemCount:widget.bag?.length??0),
    ):const Gap(1);
  }
}
