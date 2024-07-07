import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:task7_store_app/manager/transfer_data_cubit.dart';
import 'package:task7_store_app/pages/details_page.dart';


class OtherProducts extends StatefulWidget {
   OtherProducts({Key? key, this.data,this.dataIndex}) : super(key: key);
dynamic data;
dynamic dataIndex;

  @override
  State<OtherProducts> createState() => _OtherProductsState();
}

class _OtherProductsState extends State<OtherProducts> {
int ?index1;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 376,
      height: 340,
      child: ListView.separated(
          shrinkWrap: false,
          physics:const BouncingScrollPhysics(),
          itemBuilder: (context,index){
            Random random=Random();
            int ranIndex=random.nextInt(widget.data.length);
            index=ranIndex;
            while(index==widget.dataIndex['id']){
              ranIndex=random.nextInt(widget.data.length);
              index=ranIndex;
            }
        return  GestureDetector(
          onTap: (){
            BlocProvider.of<TransferDataCubit>(context).pushData(data: widget.data, index: index);
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return DetailsPage();
            }));
          },
          child: SizedBox(width: 376,
          height: 164,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image(image: NetworkImage(widget.data[index]['image'],),
                      errorBuilder:(BuildContext context, Object error, StackTrace? stackTrace) =>
                          Image.asset('assets/images/Empty.png'),
                      height: 121,
                      width: 115,
                    ),
                  ),
          const  Gap(5),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(widget.data[index]['description'],
                          maxLines: 2,
                          style:const TextStyle(fontSize:18),
                        ),
                      ),
                    ],
                  ),
            const      Gap(10),
                 const Row(
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
                      Text('${widget.data[index]['price']}৳',style:const TextStyle(
                        fontSize: 22,
                        color: Colors.orange,
                      ),
                      ),
                    ],
                  ),
                ],
              ),
            )
                ],
              ),
            ),
          ),
        );
      },
          separatorBuilder: (context,index){
            return Container(
        height: 1,
        width: double.infinity,
            color: Colors.grey,
          );
          },
          itemCount: 2),
    );
  }
}
