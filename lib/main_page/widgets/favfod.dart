import 'package:burger_app/main_page/models/fooddmodel.dart';
import 'package:burger_app/main_page/pages/food_detail_page.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';

class FavFod extends StatefulWidget {
  const FavFod({
    super.key,
    required this.foodModel,
  });
  final Fooddmodel foodModel;

  @override
  State<FavFod> createState() => _FavFodState();
}

class _FavFodState extends State<FavFod> {
  bool liked = true;

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
                  description: widget.foodModel.description,
                  imgpath: widget.foodModel.imgpath,
                  name: widget.foodModel.name,
                  price: widget.foodModel.price,
                  weight: widget.foodModel.weight,
                ),
              ),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(right: 14),
          padding: const EdgeInsets.only(right: 8, top: 8, bottom: 6),
          height: 120,
          width: 282,
          decoration: BoxDecoration(
              color: maincol2, borderRadius: BorderRadius.circular(16)),
          child: Row(
            children: [
              Image(
                image: AssetImage(widget.foodModel.imgpath),
                width: 87,
                height: 66,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.foodModel.name,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 180,
                    child: Text(
                      maxLines: 3,
                      widget.foodModel.description,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    width: 187,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.foodModel.price,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              " So'm",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 38,
                          height: 18,
                          decoration: BoxDecoration(
                              color: maincol1,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(16)),
                          child: Text(
                            "${widget.foodModel.weight} g",
                            style: TextStyle(
                                color: maincol2,
                                fontSize: 9,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // ordermodels.add(OrderModel(
                            //   name: widget.foodModel.name,
                            //   price: widget.foodModel.price,
                            //   weight: widget.foodModel.weight,
                            //   description: widget.foodModel.description,
                            //   imgpath: widget.foodModel.imgpath,
                            // ));
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
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      Positioned(
        top: 8,
        right: 15,
        child: IconButton(
          onPressed: () {
            setState(() {
              liked = !liked;
            });
          },
          icon: Icon(
            liked ? Icons.favorite : Icons.favorite_border,
            color: liked ? Colors.red : Colors.white,
          ),
        ),
      ),
    ]);
  }
}
