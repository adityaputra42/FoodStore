part of 'transaction_cubit.dart';

@immutable
abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoaded extends TransactionState {
  final List<Transaction> transactions;

  TransactionLoaded(this.transactions);

  @override
  List<Object> get props => [transactions];
}

class TransactionLoadingFail extends TransactionState {
  final String message;
  TransactionLoadingFail(this.message);

  @override
  List<Object> get props => [message];
}
