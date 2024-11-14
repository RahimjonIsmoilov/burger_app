import 'package:burger_app/main_page/pages/favoritefood_page.dart';
import 'package:burger_app/main_page/pages/food_page.dart';
import 'package:burger_app/main_page/pages/order_detail_page.dart';
import 'package:burger_app/main_page/pages/order_page.dart';
import 'package:burger_app/main_page/pages/special_order_page.dart';
import 'package:burger_app/varible.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final items = [
    Icon(
      Icons.home_rounded,
      size: 30,
      color: maincol1,
    ),
    Icon(Icons.shopping_bag_rounded, size: 30, color: maincol1),
    Icon(Icons.shopping_cart, size: 30, color: maincol1),
    Icon(Icons.favorite_rounded, size: 30, color: maincol1),
    Icon(Icons.add_circle, size: 30, color: maincol1),
  ];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: CurvedNavigationBar(
        index: index,
        animationDuration: const Duration(milliseconds: 300),
        color: maincolor,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: maincolor,
        height: 60,
        items: items,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
      ),
      body: getSelectedWidget(index: index),
    );
  }

  Widget getSelectedWidget({required int index}) {
    switch (index) {
      case 0:
        return const FoodPage();
      case 1:
        return const MyOrder();
      case 2:
        return const OrderDetailPage();

      case 3:
        return const FavoriteFoodPage();

      case 4:
        return const SpecialOrder();

      default:
        return const SizedBox(
          child: Text(
            "ishlamadi battar bo'l",
            style: TextStyle(fontSize: 75),
          ),
        );
    }
  }
}
