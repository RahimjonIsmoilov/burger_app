import 'package:burger_app/main_page/local_date/foods_list.dart';
import 'package:burger_app/main_page/models/fooddmodel.dart';
import 'package:burger_app/main_page/pages/pitsa_carousel.dart';
import 'package:burger_app/main_page/widgets/orders.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({super.key});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  int son = 1;
  int totalprice = 0;
  void qosh() {
    {
      if (son < 50) son++;
    } //bu qo'shish uchun
  }

  late final Fooddmodel fooddModel;
  void ayir() {
    {
      if (son > 0) son--;
      if (son == 0) {
        setState(() {
          foods.removeWhere(
            (foods) => foods.name == fooddModel.name,
          );
        });
      }
    } //bu ayrish uchun
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: maincol1,
        body: Container(
          margin: EdgeInsets.all(screenWidth * 0.04), // Dynamic margin
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Buyurtma tarkibi",
                  style: TextStyle(
                      color: whitetext,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(child: Orders()),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: maincol2,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(32),
                    topLeft: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Стоимость всех товаров",
                          style: TextStyle(
                              color: whitetext,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "₽540",
                          style: TextStyle(
                              color: whitetext,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Чаевые курьеру",
                            style: TextStyle(
                                color: whitetext,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "₽30",
                            style: TextStyle(
                                color: whitetext,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Общая стоимость",
                          style: TextStyle(
                              color: whitetext,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$totalprice So'm",
                          style: TextStyle(
                              color: whitetext,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PizzaCircularMenu(),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 24),
                        height: 48,
                        width: screenWidth * 0.7,
                        decoration: BoxDecoration(
                          color: maincolor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "To'lov",
                            style: TextStyle(
                                color: maincol1,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
