import 'package:burger_app/main_page/pages/hotdog_carousel.dart';
import 'package:burger_app/main_page/pages/order_detail_page.dart';
import 'package:burger_app/main_page/pages/pitsa_carousel.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';

class SelecProductPage extends StatelessWidget {
  SelecProductPage({super.key});
  final List<String> name = ["Pitsa", "Lavash", "HotDog"];
  final List<Widget> page1 = [
    const PizzaCircularMenu(),
    const OrderDetailPage(),
    const CircularMenuView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincol1,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              "Maxsus Buyurtma",
              style: TextStyle(
                  color: whitetext, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 119,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
              itemCount: 3,
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => page1[index]),
                    );
                  },
                  child: Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: maincol2),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("images/selec_pro/i-$index.png"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              name[index],
                              style: TextStyle(
                                  color: whitetext,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
