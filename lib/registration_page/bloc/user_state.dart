part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

// ignore: must_be_immutable
final class UserSuccess extends UserState {
  List<UserModel>? userList;
  UserSuccess( { this.userList});
}

final class UserError extends UserState {
  
}
