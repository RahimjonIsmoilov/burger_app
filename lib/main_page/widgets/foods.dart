import 'package:burger_app/main_page/local_date/foods_list.dart';
import 'package:burger_app/main_page/widgets/foodcard.dart';
import 'package:flutter/material.dart';

class Foods extends StatelessWidget {
  const Foods({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final int crossAxisCount =
            (MediaQuery.of(context).size.width > 600 ? 3 : 2)
                .floor(); // Ustunlar sonini hisoblash

        return GridView.builder(
          padding: const EdgeInsets.all(0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount, // Hisoblangan ustunlar soni
            crossAxisSpacing: 10, // Ustunlar orasidagi masofa
            mainAxisSpacing: 10, // Qatorlar orasidagi masofa

            childAspectRatio: 0.77, // Karta nisbatini saqlab qolish
          ),
          itemCount: foods.length,
          itemBuilder: (BuildContext context, int index) {
            return FoodCard(fooddmodel: foods[index]);
          },
        );
      },
    );
  }
}
