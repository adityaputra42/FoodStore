part of 'user_cubit.dart';

@immutable
abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final User user;

  UserLoaded(this.user);

  @override
  List<Object> get props => [user];
}

class UserLoadingFail extends UserState {
  final String message;

  UserLoadingFail(this.message);

  @override
  List<Object> get props => [message];
}
