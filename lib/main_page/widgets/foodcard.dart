import 'package:burger_app/main_page/models/fooddmodel.dart';
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
    return Container(
      padding: const EdgeInsets.only(
        top: 6,
        left: 14,
        right: 14,
      ),
      height: 220,
      width: 166,
      decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: const BorderRadius.all(Radius.circular(16))),
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
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
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
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                fooddmodel.price,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
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
                  fooddmodel.weight,
                  style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      color: maincol2),
                )),
              ),
              InkWell(
                onTap: () {},
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
              )
            ],
          )
        ],
      ),
    );
  }
}
