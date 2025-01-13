import 'package:burger_app/main_page/local_date/foods_list.dart';
import 'package:burger_app/main_page/models/fooddmodel.dart';
import 'package:burger_app/main_page/widgets/favfod.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Foodlist extends StatelessWidget {
  Foodlist({super.key});
  List<Fooddmodel> likedFoods =
      foods.where((food) => food.liked == true).toList();
  late double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height =
          likedFoods.isEmpty ? 1 : 120, // Fixed height for the horizontal list
      width: MediaQuery.of(context).size.width, // Fixed width for the list
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Horizontal scroll direction
        itemCount: likedFoods.length, // Length of the favorite food list
        itemBuilder: (context, index) {
          return Row(
            children: [
              FavFod(
                foodModel: likedFoods[
                    index], index: index, 
              ),
              const SizedBox(
                width: 10,
              )
            ],
          );
        },
      ),
    );
  }
}
