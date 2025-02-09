import 'dart:math';
import 'dart:ui';

import 'package:burger_app/main_page/api/product_model.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel/flutter_custom_carousel.dart';

class CircularMenuView extends StatefulWidget {
  const CircularMenuView({super.key});

  @override
  State<CircularMenuView> createState() => _CircularMenuViewState();
}

class _CircularMenuViewState extends State<CircularMenuView> {
  final List<_ToppingData> _toppings = [
    _ToppingData('bun', inMenu: false, added: true),
    _ToppingData(
      'lettuce',
    ),
    _ToppingData('burger', inMenu: false, added: true),
    _ToppingData(
      'cheese',
    ),
    _ToppingData('bacon'),
    _ToppingData('tomatoes'),
    _ToppingData('onions'),
    _ToppingData('pickles'),
    _ToppingData('egg'),
    _ToppingData(
      'sauce',
    ),
    _ToppingData(
      'ketchup',
    ),
    _ToppingData('mustard'),
  ];

  List products = [
    
  ];

  @override
  Widget build(BuildContext context) {
    return DemoChrome(
      backgroundColor: const Color(0xFF284E30),
      body: ClipRect(
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [maincolor, maincol1, maincol1],
              ),
            ),
          ),
          LayoutBuilder(
            builder: (_, constraints) => _buildCarousel(constraints.maxWidth),
          ),
          _buildBurger(),
        ]),
      ),
    );
  }

  Widget _buildCarousel(double width) {
    List<Widget> toppings = [];

    // Build the carousel items from the toppings list:
    for (_ToppingData t in _toppings) {
      if (!t.inMenu) continue;
      toppings.add(_buildToppingIcon(t, width * 0.5));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BackButton(),
        Expanded(
          flex: 4,
          child: CustomCarousel(
            // The carousel will have 7 items total: The 1 selected item at the front, and
            // 3 items before (clockwise) and after (counter-clockwise) it:
            itemCountBefore: 3,
            itemCountAfter: 3,
            // The items will start centered, and our effects will move them from there:
            alignment: Alignment.center,
            // The user will interact with horizontal scroll interactions (ex. swipe left/right):
            scrollDirection: Axis.horizontal,
            // Loop the items in the list infinitely:
            loop: true,
            // The effectsBuilder takes a ratio from -1 to 1 that indicates this child's
            // current position in the scroll, where 0 is the selected item,
            // and uses it to wrap the child in other widgets that apply "effects":
            effectsBuilder: (_, ratio, child) {
              // do some preliminary calculations with trig and such:
              double o = (ratio * -1 + 0.5) * pi;
              double r = width * 0.6, x = r * cos(o), y = r * sin(o) * 0.8;
              double scale = (sin(o) + 2) / 3;
              double blur = 16 * (1 - scale);

              // Working from the inside out, we wrap the child in:
              //  - an Opacity widget to fade it out as it gets further from the middle
              //  - an ImageFiltered widget to blur it as it gets further from the middle
              //  - a Transform widget to move it around in a circle
              // and then return the result:
              return Transform(
                transform: Matrix4.identity()
                  ..translate(x, y)
                  ..scale(scale),
                alignment: Alignment.center,
                child: ImageFiltered(
                    enabled: blur > 1.1,
                    imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                    child: Opacity(
                      opacity: scale,
                      child: child,
                    )),
              );
            },
            children: toppings,
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Mahsulotlar ro'yhati",
                    style: TextStyle(
                        fontSize: 28,
                        color: whitetext,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 170,
                  width: 500,
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return AddList(
                        model: products[index],
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  height: 48,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    color: maincolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Savatga Qo'shish",
                      style: TextStyle(
                          color: maincol1,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBurger() {
    List<Widget> toppings = [];
    for (_ToppingData t in _toppings) {
      if (!t.added) continue;
      toppings.add(Image.asset('images/circular_menu/${t.id}.png'));
    }

    return IgnorePointer(
      child: Align(
        alignment: const Alignment(0, -1.1),
        child: Stack(children: toppings),
      ),
    );
  }

  Widget _buildToppingIcon(_ToppingData topping, double width) {
    Widget widget = Image.asset(
      'images/circular_menu/icon-${topping.id}.png',
      width: width,
    );
    if (topping.added) {
      widget = Stack(children: [
        widget,
        Positioned(bottom: 0, left: 0, child: _buildCheckmark()),
      ]);
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          topping.added = !topping.added;
          if (!topping.added) {
            // Topping id-si mos kelgan elementni olib tashlash
            products.removeWhere((product) => product.name == topping.id);
          } else {
            // Yangi topping qo'shish
            // products.add(ProductModel(cost: 150, name: topping.id));
          }
        });
      },
      child: widget,
    );
  }

  Widget _buildCheckmark() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF284E30),
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.check_circle, color: whitetext, size: 48),
    );
  }
}

class AddList extends StatelessWidget {
  const AddList({
    super.key,
    required this.model,
  });

  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Text(
        //   model.name,
        //   style: TextStyle(color: whitetext, fontSize: 18),
        // ),
        // Text(
        //   model.cost.toString(),
        //   style: TextStyle(color: whitetext, fontSize: 18),
        // )
      ],
    );
  }
}

class _ToppingData {
  _ToppingData(this.id, {this.inMenu = true, this.added = false});

  final String id;
  final bool inMenu;
  bool added;
}

class DemoChrome extends StatelessWidget {
  const DemoChrome({super.key, required this.body, this.backgroundColor});

  final Widget body;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ClipRect(
        child: Stack(children: [
          RepaintBoundary(child: body),
        ]),
      ),
    );
  }
}
