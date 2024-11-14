import 'package:burger_app/main_page/widgets/food_list.dart';
import 'package:burger_app/main_page/widgets/foods.dart';
import 'package:burger_app/profil_page/profil_page.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 16, left: 16),
      color: maincol1,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              children: [
                const Text(
                  "Привет, Максим",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 83),
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2)),
                  child: const Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilPage(),
                        ),
                      );
                    },
                    icon: const Image(
                      image: AssetImage(
                        "images/user.png",
                      ),
                      height: 36,
                      width: 36,
                    )),
              ],
            ),
          ),
          Container(
            width: 360,
            height: 7,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: maincolor,
                border: Border.all(color: maincolor)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Ваши любимые товары",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Посмотреть все",
                    style: TextStyle(color: maincolor),
                  ))
            ],
          ),
          const Foodlist(),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Все товары",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                TextButton(
                    style: const ButtonStyle(
                        overlayColor: WidgetStatePropertyAll(Colors.white24)),
                    onPressed: () {},
                    child: Text(
                      "Посмотреть все",
                      style: TextStyle(
                          color: maincolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ))
              ],
            ),
          ),
          const Foods(),
        ],
      ),
    );
  }
}