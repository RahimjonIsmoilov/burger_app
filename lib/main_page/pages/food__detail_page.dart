import 'package:burger_app/main_page/local_date/order_list.dart';
import 'package:burger_app/main_page/models/fooddmodel.dart';
import 'package:burger_app/main_page/models/order_model.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';

class FoodDetail extends StatefulWidget {
  final Fooddmodel fooddmodel;
  const FoodDetail({super.key, required this.fooddmodel});

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  int son = 1;

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
      body: Column(
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
                  image: AssetImage(widget.fooddmodel.imgpath),
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
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
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
                Text(
                  widget.fooddmodel.name,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 17, bottom: 70),
                  child: Text(
                    maxLines: 5,
                    widget.fooddmodel.description,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70,
                      overflow: TextOverflow.ellipsis,
                    ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: qosh,
                              icon: const Icon(
                                Icons.add_circle,
                                color: Colors.green,
                                size: 24,
                              ),
                            ),
                            Text(
                              "$son",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            IconButton(
                              onPressed: ayir,
                              icon: const Icon(
                                Icons.remove_circle,
                                color: Colors.red,
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
                        const Text(
                          "Общая стоимость",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 14),
                        ),
                        Text(
                          widget.fooddmodel.price,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 26),
                        )
                      ],
                    )
                  ],
                ),
                Container(
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
                        ordermodels.add(OrderModel(
                            name: widget.fooddmodel.name,
                            price: widget.fooddmodel.price,
                            weight: widget.fooddmodel.weight,
                            comment: widget.fooddmodel.description,
                            imagepath: widget.fooddmodel.imgpath));
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
                          "Добавить в заказы ",
                          style: TextStyle(
                              color: maincol1,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
