import 'package:burger_app/main_page/local_date/foods_list.dart';
import 'package:burger_app/main_page/models/fooddmodel.dart';

import 'package:burger_app/main_page/widgets/orderwidget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Orders extends StatelessWidget {
  Orders({super.key});
  List<Fooddmodel> orderfoods =
      foods.where((food) => food.ordercount > 0).toList();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderfoods.length,
      itemBuilder: (context, index) {
        return OrderDetailWidget(
          orderfoods: orderfoods[index],
        );
      },
    );
  }
}
