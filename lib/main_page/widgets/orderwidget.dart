import 'package:burger_app/main_page/local_date/order_list.dart';
import 'package:burger_app/main_page/models/order_model.dart';
import 'package:flutter/material.dart';

class OrderDetailWidget extends StatefulWidget {
  final OrderModel orderModel;
  const OrderDetailWidget({super.key, required this.orderModel});

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
            ordermodels.remove(OrderModel(
                name: widget.orderModel.name,
                price: widget.orderModel.price,
                weight: widget.orderModel.weight,
                description: widget.orderModel.description,
                imgpath: widget.orderModel.imgpath));
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
              widget.orderModel.imgpath,
            ),
            width: 88,
            height: 78,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.orderModel.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 120,
                child: Text(
                  maxLines: 1,
                  widget.orderModel.description,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                widget.orderModel.price,
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
