part of 'transfer_data_cubit.dart';


sealed class TransferDataState {}

final class TransferDataInitial extends TransferDataState {}
final class TransferDataSuccess extends TransferDataState {}
