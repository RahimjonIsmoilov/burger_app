// import 'package:burger_app/main_page/local_date/food_list.dart';
import 'package:burger_app/main_page/widgets/food_list.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(right: 16, left: 16),
        color: maincol1,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 64),
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
                      onPressed: () {},
                      icon: const Image(
                        image: AssetImage(
                          "images/check.png",
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
            Row(
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
                        overlayColor: MaterialStatePropertyAll(Colors.white24)),
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
            // Card(
            //   elevation: 8,
            //   child: GridView.builder(
            //       padding: const EdgeInsets.all(12),
            //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            //           maxCrossAxisExtent: 120,
            //           childAspectRatio: 3 / 2,
            //           crossAxisSpacing: 10,
            //           mainAxisSpacing: 10),
            //       itemCount: favfoodlists.length,
            //       itemBuilder: (_, int index) {}),
            // )
          ],
        ),
      ),
    );
  }
}
