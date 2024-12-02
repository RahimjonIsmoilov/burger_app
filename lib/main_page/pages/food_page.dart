import 'package:burger_app/main_page/widgets/food_list.dart';
import 'package:burger_app/main_page/widgets/foods.dart';
import 'package:burger_app/profil_page/profil_page.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: maincol1,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30), // Yuqoridan bo'sh joy
            // User va qidiruv paneli
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Привет, Максим",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilPage()),
                        );
                      },
                      icon: const Image(
                        image: AssetImage("images/user.png"),
                        height: 36,
                        width: 36,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10), // User va pastki chiziq orasidagi joy
            Container(
              width: double.infinity,
              height: 7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: maincolor,
              ),
            ),
            const SizedBox(height: 20),
            // "Ваши любимые товары" sarlavhasi
            const Foodlist(),
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
                  ),
                ),
              ],
            ),
           
            const Expanded(
              child: Foods(), // GridView ichida oziq-ovqat kartalari
            ),
          ],
        ),
      ),
    );
  }
}
