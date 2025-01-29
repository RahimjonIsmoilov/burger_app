import 'package:burger_app/core/extensions/str_ext.dart';
import 'package:burger_app/main_page/api/product_model.dart';
import 'package:burger_app/main_page/pages/food_detail_page.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.productModel,
    required this.index,
  });
  final ProductModel productModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetail(
              productmodel: productModel,
              index: index,
            ),
          ),
        );
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
              child: Image.network(
                productModel.bigImage.image,
                width: 150,
                height: 120,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.image_not_supported,
                    size: 50,
                    color: Colors.grey,
                  );
                },
              ),
            ),
            Text(
              productModel.name!,
              maxLines: 1,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: whitetext,
              ),
            ),
            SizedBox(
              width: 145,
              child: Text(
                productModel.name!,
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
                  "${productModel.price}",
                  style: TextStyle(
                      color: whitetext,
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
                      "${productModel.price} g",
                      style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: maincol2),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // ordermodels.add(OrderModel(
                    //     name: fooddmodel.name,
                    //     price: fooddmodel.price,
                    //     weight: fooddmodel.weight,
                    //     description: fooddmodel.description,
                    //     imgpath: fooddmodel.imgpath));
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
