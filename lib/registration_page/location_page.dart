import 'package:burger_app/registration_page/begin_screen.dart';
import 'package:burger_app/registration_page/congrulations_page.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(left: 25, right: 25),
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
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
            Padding(
              padding: const EdgeInsets.only(top: 38, bottom: 20),
              child: Text(
                "Укажите свое местоположение",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: whitetext),
              ),
            ),
            const Text(
              "Ваши данные буду доступны только вам",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            Container(
              margin: const EdgeInsets.only(top: 47),
              padding: const EdgeInsets.only(
                  top: 12.5, left: 13, bottom: 13, right: 12.5),
              decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              height: 128,
              width: 335,
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: maincolor,
                        size: 32,
                      ),
                      Text(
                        "Ваше местоположение",
                        style: TextStyle(color: whitetext, fontSize: 14),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Buttons(
                      col: Colors.grey,
                      texcol: whitetext,
                      tex: "Указать местоположение",
                      tap: () {})
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250),
              child: Buttons(
                  col: maincolor,
                  texcol: Colors.black,
                  tex: "Далее",
                  tap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CongrulationsPage(),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
