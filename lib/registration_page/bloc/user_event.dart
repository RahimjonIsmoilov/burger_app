part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class UserLoadingData extends UserEvent{
  get login => null;
}
