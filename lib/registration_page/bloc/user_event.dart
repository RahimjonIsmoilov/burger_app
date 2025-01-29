part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class UserLoadingData extends UserEvent {
  get login => null;
}

class UserLoginEvent extends UserEvent {
  final UserModel model;
  UserLoginEvent({required this.model});
}

class GetLocaleUserdata extends UserEvent {
  GetLocaleUserdata();
}
