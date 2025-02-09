import 'package:burger_app/main_page/bloc/food_bloc.dart';
import 'package:burger_app/main_page/local_date/foods_list.dart';
import 'package:burger_app/main_page/models/fooddmodel.dart';
import 'package:burger_app/main_page/pages/food_detail_page.dart';

import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavFod extends StatefulWidget {
  const FavFod({
    super.key,
    required this.foodModel,
    this.width = 282,
    required this.index,
  });
  final Fooddmodel foodModel;
  final double width;
  final int index;
  @override
  State<FavFod> createState() => _FavFodState();
}

class _FavFodState extends State<FavFod> {
  bool liked = true;
  List<Fooddmodel> likedFoods =
      foods.where((food) => food.liked == true).toList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {
        if (state is FoodSucces) {
          return Stack(children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodDetail(
                      productmodel: state.productList[0],
                      index: widget.index,
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.only(right: 8, top: 8, bottom: 6),
                height: 120,
                width: widget.width,
                decoration: BoxDecoration(
                    color: maincol2, borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage(widget.foodModel.imgpath),
                      width: 87,
                      height: 66,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.foodModel.name,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: whitetext),
                          ),
                          SizedBox(
                            width: 180,
                            child: Text(
                              maxLines: 3,
                              widget.foodModel.description,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 12),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      widget.foodModel.price,
                                      style: TextStyle(
                                          color: whitetext,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      " So'm",
                                      style: TextStyle(
                                          color: whitetext,
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
                                    // widget.foodModel.add(OrderModel(
                                    //   name: widget.foodModel.name,
                                    //   price: widget.foodModel.price,
                                    //   weight: widget.foodModel.weight,
                                    //   description: widget.foodModel.description,
                                    //   imgpath: widget.foodModel.imgpath,)
                                  },
                                  child: Container(
                                    height: 32,
                                    width: 32,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 2, color: maincolor)),
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
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 5,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    liked = !liked;
                    if (liked == false) {
                      foods.removeWhere(
                        (foods) => foods.name == widget.foodModel.name,
                      );
                    }
                  });
                },
                icon: Icon(
                  liked ? Icons.favorite : Icons.favorite_border,
                  color: liked ? Colors.red : whitetext,
                ),
              ),
            ),
          ]);
        }
        return const Text("data");
      },
    );
  }
}
