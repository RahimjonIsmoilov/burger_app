part of 'food_bloc.dart';

@immutable
sealed class FoodState {}

final class FoodInitial extends FoodState {}

final class FoodLoading extends FoodState {}

// ignore: must_be_immutable
final class FoodSucces extends FoodState {
  List<ProductModel> productList;
  FoodSucces({required this.productList});
}

final class FoodError extends FoodState {}
