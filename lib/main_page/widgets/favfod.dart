import 'package:burger_app/main_page/models/favfoodmodel.dart';
import 'package:burger_app/main_page/models/fooddmodel.dart';
import 'package:burger_app/main_page/models/order_model.dart';
import 'package:burger_app/main_page/pages/food_detail_page.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';

import '../local_date/order_list.dart';

class FavFod extends StatelessWidget {
  const FavFod({
    super.key,
    required this.foodModel,
  });
  final FavFoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodDetail(
                fooddmodel: Fooddmodel(
                    description: foodModel.description,
                    imgpath: foodModel.imgpath,
                    name: foodModel.name,
                    price: foodModel.price,
                    weight: foodModel.weight),
              ),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(right: 14),
          height: 120,
          width: 282,
          decoration: BoxDecoration(
              color: maincol2, borderRadius: BorderRadius.circular(16)),
          child: Row(
            children: [
              Image(
                image: AssetImage(foodModel.imgpath),
                width: 87,
                height: 66,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 11),
                    child: Text(
                      foodModel.name,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 187,
                    child: Text(
                      foodModel.description,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "${foodModel.price} so'm",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(left: 20, bottom: 8, right: 10),
                        alignment: Alignment.center,
                        width: 38,
                        height: 18,
                        decoration: BoxDecoration(
                            color: maincol1,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          "${foodModel.weight} g",
                          style: TextStyle(
                              color: maincol2,
                              fontSize: 9,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ordermodels.add(OrderModel(
                            name: foodModel.name,
                            price: foodModel.price,
                            weight: foodModel.weight,
                            description: foodModel.description,
                            imgpath: foodModel.imgpath,
                          ));
                        },
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 2, color: maincolor)),
                          child: Icon(
                            Icons.shopping_bag,
                            color: maincolor,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: 230,
        ),
        child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 19,
            )),
      ),
    ]);
  }
}
