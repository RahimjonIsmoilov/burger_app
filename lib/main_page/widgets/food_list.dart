import 'package:burger_app/main_page/local_date/food_list.dart';
import 'package:burger_app/main_page/widgets/favfod.dart';
import 'package:flutter/material.dart';

class Foodlist extends StatelessWidget {
  const Foodlist({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120, // Fixed height for the horizontal list
      width: MediaQuery.of(context).size.width, // Fixed width for the list
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Horizontal scroll direction
        itemCount: favfoodlists.length, // Length of the favorite food list
        itemBuilder: (context, index) {
          // Returning the custom widget for each food item
          return FavFod(
            foodModel: favfoodlists[
                index], // Passing the food model to the FavFod widget
          );
        },
      ),
    );
  }
}
