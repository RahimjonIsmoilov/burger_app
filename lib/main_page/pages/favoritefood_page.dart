import 'package:burger_app/main_page/local_date/foods_list.dart';
import 'package:burger_app/main_page/models/fooddmodel.dart';
import 'package:burger_app/main_page/widgets/favfod.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';

class FavoriteFoodPage extends StatefulWidget {
  const FavoriteFoodPage({super.key});

  @override
  State<FavoriteFoodPage> createState() => _FavoriteFoodPageState();
}

class _FavoriteFoodPageState extends State<FavoriteFoodPage> {
  List<Fooddmodel> likedFoods =
      foods.where((food) => food.liked == true).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincol1,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Sevimlilar",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: whitetext),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: likedFoods.length,
                  itemBuilder: (context, index) {
                    final favfood = likedFoods[index];
                    return Column(
                      children: [
                        FavFod(
                          width: MediaQuery.of(context).size.width,
                          foodModel: Fooddmodel(
                              imgpath: favfood.imgpath,
                              name: favfood.name,
                              description: favfood.description,
                              price: favfood.price,
                              weight: favfood.weight,
                              category: favfood.category), index: index,
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
