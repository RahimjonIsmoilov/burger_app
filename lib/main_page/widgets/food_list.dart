import 'package:burger_app/main_page/local_date/food_list.dart';
import 'package:burger_app/main_page/widgets/favfod.dart';
import 'package:flutter/material.dart';

class Foodlist extends StatelessWidget {
  const Foodlist({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 350,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: favfoodlists.length,
          itemBuilder: (context, index) {
            return FavFod(
              foodModel: favfoodlists[index],
            );
          }),
    );
  }
}
