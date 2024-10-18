import 'package:burger_app/main_page/models/foodsmodel.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';

class FavFod extends StatelessWidget {
  const FavFod({
    super.key,
    required this.foodModel,
  });
  final FavFoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: const EdgeInsets.only(right: 14),
        height: 120,
        width: 282,
        decoration: BoxDecoration(
            color: maincol2, borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Image(
              image: AssetImage(foodModel.imagepath),
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
                    foodModel.comment,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      foodModel.price,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 52, right: 8),
                      alignment: Alignment.center,
                      width: 38,
                      height: 18,
                      decoration: BoxDecoration(
                          color: maincol1,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16)),
                      child: Text(
                        foodModel.weight,
                        style: TextStyle(
                            color: maincol2,
                            fontSize: 9,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
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
                    )
                  ],
                )
              ],
            )
          ],
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
