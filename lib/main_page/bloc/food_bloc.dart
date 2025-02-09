import 'package:bloc/bloc.dart';
import 'package:burger_app/main_page/api/product_model.dart';
import 'package:burger_app/main_page/api/product_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc() : super(FoodInitial()) {
    on<FoodEvent>((event, emit) {
      
    });

    on<FoodLoadingData>((event, emit) async {
      emit(FoodLoading());
      try {
        final result = await ProductRepository().getData();
        if (result!=[]) {
          emit(FoodSucces(productList: result));
        }else{
          emit(FoodError());
        }
      } catch (e) {
        emit(FoodError());
      }
    });
  }
}
