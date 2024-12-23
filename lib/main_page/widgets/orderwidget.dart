import 'package:burger_app/main_page/local_date/foods_list.dart';
import 'package:burger_app/main_page/models/fooddmodel.dart';
import 'package:flutter/material.dart';

class OrderDetailWidget extends StatefulWidget {
  final Fooddmodel fooddmodel;
  const OrderDetailWidget({super.key, required this.fooddmodel,});

  @override
  State<OrderDetailWidget> createState() => _OrderDetailWidgetState();
}

class _OrderDetailWidgetState extends State<OrderDetailWidget> {
  int son = 1;

  void qosh() {
    {
      if (son < 50) son++;
    } //bu qo'shish uchun
  }

  void ayir() {
    {
      if (son > 0) {
        son--;
        if (son == 0) {
          setState(() {
            foods.remove(Fooddmodel(
                name: widget.fooddmodel.name,
                price: widget.fooddmodel.price,
                weight: widget.fooddmodel.weight,
                description: widget.fooddmodel.description,
                imgpath: widget.fooddmodel.imgpath));
          });
        }
      }
    } //bu ayrish uchun
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(
              widget.fooddmodel.imgpath,
            ),
            width: 88,
            height: 78,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.fooddmodel.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 120,
                child: Text(
                  maxLines: 1,
                  widget.fooddmodel.description,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                widget.fooddmodel.price,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      qosh();
                    });
                  },
                  icon: const Icon(
                    Icons.add_circle,
                    color: Colors.green,
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
                  onPressed: () {
                    setState(() {
                      ayir();
                    });
                  },
                  icon: const Icon(
                    Icons.remove_circle,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
