part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

// ignore: must_be_immutable
final class UserSucces extends UserState {
  List<UserModel> userList;
  UserSucces( {required this.userList});
}

final class UserError extends UserState {
  
}
