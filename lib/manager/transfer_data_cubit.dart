import 'package:flutter_bloc/flutter_bloc.dart';
part 'transfer_data_state.dart';

class TransferDataCubit extends Cubit<TransferDataState> {
  TransferDataCubit() : super(TransferDataInitial());
  String ?category;
  List<Map<String,dynamic>>?data;
  int ?index;
  int ?totalPayment;
  List<Map>?bag;
  void pushCategory({required String category}){
    this.category= category;
  }
void pushData({required List<Map<String,dynamic>>data,required int index}){
    this.data= data;
    this.index=index;
  }
  void pushToBag({required List<Map>bag}){
    this.bag=bag;
  }
  void pushPayment({required int totalPayment}){
    this.totalPayment=totalPayment;
    emit(TransferDataSuccess());
  }
}
