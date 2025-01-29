import 'package:burger_app/core/extensions/str_ext.dart';
import 'package:burger_app/main_page/api/product_model.dart';
import 'package:burger_app/main_page/bloc/food_bloc.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodDetail extends StatefulWidget {
  final int index;
  final ProductModel productmodel;
  const FoodDetail(
      {super.key, required this.productmodel, required this.index});

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  int son = 1;
  bool liked = false;
  void qosh() {
    setState(() {
      if (son < 50) son++;
    });
  }

  void ayir() {
    setState(() {
      if (son > 1) son--;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: maincol1,
      body: BlocBuilder<FoodBloc, FoodState>(
        builder: (context, state) {
          if (state is FoodSucces) {
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Positioned(
                      right: 20,
                      child: Image(
                        image: const AssetImage("images/Smoke.png"),
                        width: screenWidth,
                        height: screenHeight * 0.4,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Image(
                        image: NetworkImage(
                          state.productList[widget.index].bigImage.image,
                        ),
                        width: screenWidth,
                        height: screenHeight * 0.4,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 10,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 44,
                          width: 44,
                          margin: const EdgeInsets.only(top: 61),
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: maincolor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: whitetext,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 27, right: 27),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.productList[widget.index].name!,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: whitetext),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                liked = !liked;
                              });
                            },
                            icon: Icon(
                              liked ? Icons.favorite : Icons.favorite_border,
                              color: liked ? Colors.red : whitetext,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 17, bottom: 70),
                        child: Text(
                          state.productList[widget.index].name!,
                          maxLines: 5,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: whitetext,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Og'irligi",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: whitetext,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              "${state.productList[widget.index].weight} g",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: whitetext,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 111,
                            height: 42,
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: ayir,
                                    icon: const Icon(
                                      Icons.remove_circle,
                                      color: Colors.red,
                                      size: 24,
                                    ),
                                  ),
                                  Text(
                                    "$son",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: whitetext),
                                  ),
                                  IconButton(
                                    onPressed: qosh,
                                    icon: const Icon(
                                      Icons.add_circle,
                                      color: Colors.green,
                                      size: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Общая стоимость",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: whitetext,
                                    fontSize: 14),
                              ),
                              Text(
                                "${(state.productList[widget.index].price! * son)} So'm",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: whitetext,
                                    fontSize: 26),
                              )
                            ],
                          )
                        ],
                      ),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 40),
                          height: MediaQuery.of(context).size.height / 16,
                          width: MediaQuery.of(context).size.width / 1.3,
                          decoration: BoxDecoration(
                              color: maincolor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16))),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                // foods.add(Fooddmodel(
                                //     ordercount: son,
                                //     name: widget.productmodel.name,
                                //     price: widget.productmodel.price,
                                //     weight: widget.productmodel.weight,
                                //     description:
                                //         widget.productmodel.description,
                                //     imgpath: widget.productmodel.imgpath,
                                //     liked: widget.productmodel.liked,
                                //     category: widget.productmodel.category));
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.shopping_cart,
                                  size: 30,
                                ),
                                Text(
                                  "Savatga qo'shish",
                                  style: TextStyle(
                                      color: maincol1,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }
          if (state is FoodError) {
            return const Center(
              child: Icon(
                Icons.error_outline,
                size: 120,
                color: Colors.red,
              ),
            );
          }
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const Card(
              child: Text("XAto"),
            ),
          );
        },
      ),
    );
  }
}
