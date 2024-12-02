import 'package:burger_app/main_page/local_date/order_list.dart';
import 'package:burger_app/main_page/widgets/orderwidget.dart';
import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ordermodels.length,
      
      itemBuilder: (context, index) {
        return OrderDetailWidget(orderModel: ordermodels[index]);
      },
    );
  }
}
