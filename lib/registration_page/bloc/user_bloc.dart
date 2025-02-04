import 'package:bloc/bloc.dart';
import 'package:burger_app/registration_page/api/user_model.dart';
import 'package:burger_app/registration_page/api/user_repository.dart';
import 'package:meta/meta.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserRegisterEvent>((event, emit) async {
      emit(UserLoading());
      try {
        final result = await UserRepository().registration(event.model);
        if (result) {
          emit(UserSuccess());
        } else {
          emit(UserError());
        }
      } catch (e) {
        emit(UserError());
      }
    });

    on<UserLoginEvent>((event, emit) async {
      emit(UserLoading());
      try {
        final result = await UserRepository().login(event.model);
        if (result) {
          emit(UserSuccess());
        } else {
          emit(UserError());
        }
      } catch (e) {
        emit(UserError());
      }
    });
  }
}
