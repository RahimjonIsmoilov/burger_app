import 'package:burger_app/main_page/local_date/order_list.dart';
import 'package:burger_app/main_page/models/fooddmodel.dart';
import 'package:burger_app/main_page/models/order_model.dart';
import 'package:burger_app/main_page/pages/food_detail_page.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.fooddmodel,
  });
  final Fooddmodel fooddmodel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FoodDetail(fooddmodel: fooddmodel)));
      },
      child: Container(
        height: 220,
        width: 160,
        padding: const EdgeInsets.only(
          top: 6,
          left: 14,
          right: 14,
        ),
        decoration: BoxDecoration(
          color: maincol2,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image(
                image: AssetImage(fooddmodel.imgpath),
                width: 129,
                height: 99,
              ),
            ),
            Text(
              fooddmodel.name,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              width: 145,
              height: 50,
              child: Text(
                fooddmodel.description,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  fooddmodel.price,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 38,
                  height: 18,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Center(
                    child: Text(
                      "${fooddmodel.weight} g",
                      style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: maincol2),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    ordermodels.add(OrderModel(
                        name: fooddmodel.name,
                        price: fooddmodel.price,
                        weight: fooddmodel.weight,
                        description: fooddmodel.description,
                        imgpath: fooddmodel.imgpath));
                  },
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: maincolor,
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
