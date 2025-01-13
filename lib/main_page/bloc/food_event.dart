part of 'food_bloc.dart';

@immutable
sealed class FoodEvent {}

class FoodLoadingData extends FoodEvent{}
