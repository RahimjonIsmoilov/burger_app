import 'package:burger_app/registration_page/begin_screen.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';

class TrackOrderPage extends StatelessWidget {
  const TrackOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincol1,
      appBar: AppBar(
        backgroundColor: maincol1,
        title: Text(
          "Track Order",
          style: TextStyle(color: whitetext, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: BackButton(
          color: whitetext,
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 📌 Tafsilotlar bo'limi
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 167,
                  width: 345,
                  decoration: BoxDecoration(
                      color: maincol2, borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    children: [
                      const Text(
                        "Tavsilot",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildOrderItem(),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 📌 Timeline bosqichlari
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTimelineStep(
                        "Buyurtma olindi",
                        "Sizning buyurtmangizni oldik",
                        "12 Feb 2024\n10:30 AM",
                        true),
                    _buildTimelineStep(
                        "To'lov tasdiqlandi",
                        "Sizning buyurtmangiz tasdiqlandi",
                        "12 Feb 2024\n11:20 AM",
                        true),
                    _buildTimelineStep(
                        "Tayyorlanmoqda",
                        "Buyurtmangiz tayyorlanmoqda",
                        "12 Feb 2024\n09:00 PM",
                        true),
                    _buildTimelineStep("Out for Delivery",
                        "Estimated for 13 Feb, 2024", "", false),
                    _buildTimelineStep(
                        "Delivered", "Estimated for 13 Feb, 2024", "", false),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.green)),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Tasdiqlash",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            // 📌 Qabul qilish tugmasi
            SizedBox(
              height: 50,
              child: Buttons(
                  col: maincolor,
                  texcol: maincol1,
                  tex: "Qabul qildim",
                  tap: () {}),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem() {
    return SizedBox(
      height: 111,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Чикен Бургер",
                  maxLines: 1,
                  style: TextStyle(
                    overflow: TextOverflow.clip,
                    fontSize: 18,
                    color: whitetext,
                  ),
                ),
              ),
              Text(
                "₽320",
                style: TextStyle(fontSize: 18, color: whitetext),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _buildTimelineStep(
      String title, String subtitle, String time, bool completed) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 2),
                color: completed ? Colors.green : Colors.transparent,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 2,
              height: 50,
              color: Colors.green,
            ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: completed ? Colors.white : Colors.grey,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                            color: completed ? Colors.white : Colors.grey),
                      ),
                    ],
                  ),
                  if (time.isNotEmpty)
                    Text(
                      time,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
