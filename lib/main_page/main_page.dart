import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:burger_app/main_page/pages/circular_carousel.dart';
import 'package:burger_app/main_page/pages/favoritefood_page.dart';
import 'package:burger_app/main_page/pages/food_page.dart';
import 'package:burger_app/main_page/pages/order_detail_page.dart';
import 'package:burger_app/main_page/pages/order_page.dart';
import 'package:burger_app/varible.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  final List<Widget> _pages = const [
    FoodPage(),
    MyOrder(),
    OrderDetailPage(),
    FavoriteFoodPage(),
    CircularMenuView(),
  ];

  final List<Icon> items = [
    Icon(Icons.home_rounded, size: 30, color: maincol1),
    Icon(Icons.shopping_bag_rounded, size: 30, color: maincol1),
    Icon(Icons.shopping_cart, size: 30, color: maincol1),
    Icon(Icons.favorite_rounded, size: 30, color: maincol1),
    Icon(Icons.add_circle, size: 30, color: maincol1),
  ];

  void onNavBarItemSelected(int selectedIndex) {
    setState(() {
      index = selectedIndex;
    });
  }

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
        onTap: onNavBarItemSelected,
      ),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _pages[index],
        ),
      ),
    );
  }
}
