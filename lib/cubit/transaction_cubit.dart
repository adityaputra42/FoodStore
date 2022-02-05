import 'package:bloc/bloc.dart';
import 'package:food_market/services/services.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:food_market/models/model.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future<void> getTransactions() async {
    ApiReturnValue<List<Transaction>> result =
        await TransactionServices.getTransactions();

    if (result.value != null) {
      emit(TransactionLoaded(result.value!));
    } else {
      emit(TransactionLoadingFail(result.message!));
    }
  }

  Future<String?> submitTransaction(Transaction transaction) async {
    ApiReturnValue<Transaction> result =
        await TransactionServices.submitTransaction(transaction);
    if (result.value != null) {
      emit(TransactionLoaded(
          (state as TransactionLoaded).transactions + [result.value!]));
      return result.value!.paymentUrl!;
    } else {
      return null;
    }
  }
}
