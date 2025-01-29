import 'package:burger_app/main_page/bloc/food_bloc.dart';
import 'package:burger_app/main_page/widgets/food_list.dart';
import 'package:burger_app/main_page/widgets/foods.dart';
import 'package:burger_app/profil_page/profil_page.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedindex = 0;
  late String category = "Hammasi";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: maincol1,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Привет, Максим",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: whitetext),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search, color: whitetext),
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
                        image: AssetImage("images/user.png"),
                        height: 36,
                        width: 36,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: maincolor,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ваши любимые товары",
                  style: TextStyle(
                      color: whitetext,
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
            Foodlist(),
            SizedBox(
                height: 40,
                child: BlocBuilder<FoodBloc, FoodState>(
                  builder: (context, state) {
                    if (state is FoodSucces) {
                      final productList = state.productList;
                      if (productList.isEmpty) {
                        return const Center(
                            child: Text("Mahsulotlar mavjud emas"));
                      }

                      late List<String> uniqueCategories = ["Hammasi"] +
                          productList
                              .map((product) => product.category ?? '')
                              .toSet()
                              .toList();

                      return ListView.builder(
                        itemCount: uniqueCategories.length,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final isSelected = selectedindex == index;
                          return InkWell(
                            onTap: () {
                              setState(() {
                                category = uniqueCategories[index];
                                selectedindex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 1),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: isSelected ? maincolor : maincol2,
                                    width: 1),
                                color: isSelected ? maincolor : maincol2,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                uniqueCategories[index],
                                style: TextStyle(
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: isSelected ? Colors.black : whitetext,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const Center(child: LinearProgressIndicator());
                  },
                )),
            Expanded(
              child: Foods(
                categor: category,
              ), // GridView ichida oziq-ovqat kartalari
            ),
          ],
        ),
      ),
    );
  }
}
