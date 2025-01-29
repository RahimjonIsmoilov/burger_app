import 'package:bloc/bloc.dart';
import 'package:burger_app/registration_page/api/user_model.dart';
import 'package:burger_app/registration_page/api/user_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) {
      
    });

    on<UserLoadingData>((event, emit) async {
      emit(UserLoading());
      try {
        final result = await UserRepository().getData();
        if (result!=[] ) {
          emit(UserSucces(userList: result));
        }else{
          emit(UserError());
        }
      } catch (e) {
        emit(UserError());
      }
    });
  }
}
