import 'package:burger_app/main_page/local_date/foods_list.dart';

import 'package:burger_app/main_page/widgets/orderwidget.dart';
import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return OrderDetailWidget(
          fooddmodel: foods[index],
        );
      },
    );
  }
}
