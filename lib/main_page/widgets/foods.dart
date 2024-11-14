import 'package:burger_app/main_page/local_date/foods_list.dart';
import 'package:burger_app/main_page/widgets/foodcard.dart';
import 'package:flutter/material.dart';

class Foods extends StatelessWidget {
  const Foods({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 439,
      child: GridView.builder(
        padding: const EdgeInsets.all(0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.77,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: foods.length,
        itemBuilder: (BuildContext context, int index) {
          return FoodCard(fooddmodel: foods[index]);
        },
      ),
    );
  }
}
