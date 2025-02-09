import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        width: 390,
        height: 757,
        margin: const EdgeInsets.only(right: 16, left: 16, top: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Order",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: whitetext),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search_rounded,
                    color: whitetext,
                  ),
                ),
              ],
            ),
            TabBar(
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              labelColor: whitetext,
              unselectedLabelColor: whitetext,
              indicator: BoxDecoration(
                border: Border.all(width: 2),
                shape: BoxShape.rectangle,
                color: maincolor,
                borderRadius: BorderRadius.circular(10),
              ),
              tabs: [
                Tab(
                  child: Container(
                    height: 45,
                    width: 94,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        border: Border.all(width: 1, color: maincolor)),
                    child: const Center(child: Text("hammasi")),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 45,
                    width: 94,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        border: Border.all(width: 1, color: maincolor)),
                    child: const Center(child: Text("Jarayonda")),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 45,
                    width: 94,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        border: Border.all(width: 1, color: maincolor)),
                    child: const Center(child: Text("Yetkazilgan")),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Accordion(
                headerPadding: const EdgeInsets.all(0),
                paddingBetweenClosedSections: 31,
                headerBackgroundColor: maincol1,
                children: [
                  AccordionSection(
                    headerBackgroundColorOpened: maincol1,
                    contentBackgroundColor: maincol1,
                    contentBorderColor: maincolor,
                    rightIcon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: whitetext,
                      size: 28,
                    ),
                    leftIcon: Container(
                      height: 46,
                      width: 46,
                      decoration: BoxDecoration(
                        color: maincolor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        size: 24,
                        Icons.bookmarks_rounded,
                        color: maincol1,
                      ),
                    ),
                    header: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Заказ ID #035912",
                          style: TextStyle(
                              fontSize: 12,
                              color: whitetext,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "4 товара - Доставляется",
                          style: TextStyle(
                              fontSize: 10,
                              color: whitetext,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    content: SizedBox(
                      height: 140,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 36,
                                width: 36,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
