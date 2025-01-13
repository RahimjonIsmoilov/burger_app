import 'package:burger_app/main_page/local_date/foods_list.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';

class OrderDetailWidget extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final orderfoods;
  const OrderDetailWidget({
    super.key,
    this.orderfoods,
  });

  @override
  State<OrderDetailWidget> createState() => _OrderDetailWidgetState();
}

class _OrderDetailWidgetState extends State<OrderDetailWidget> {
  int son = 1;

  void qosh() {
    {
      if (widget.orderfoods.ordercount < 50) {
        setState(() {
          widget.orderfoods.ordercount = widget.orderfoods.ordercount + 1;
        });
      }
    } //bu qo'shish uchun
  }

  void ayir() {
    {
      if (widget.orderfoods.ordercount > 0) {
        widget.orderfoods.ordercount--;
        if (widget.orderfoods.ordercount == 0) {
          setState(() {
            foods.removeWhere(
              (foods) => foods.name == widget.orderfoods.name,
            );
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
        color: maincol2,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(
              widget.orderfoods.imgpath,
            ),
            width: 88,
            height: 78,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.orderfoods.name,
                style: TextStyle(
                    color: whitetext,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 120,
                child: Text(
                  maxLines: 1,
                  widget.orderfoods.description,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                widget.orderfoods.price,
                style: TextStyle(
                    color: whitetext,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: maincol1,
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
                  "${widget.orderfoods.ordercount}",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: whitetext),
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
