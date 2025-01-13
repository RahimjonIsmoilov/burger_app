import 'package:burger_app/registration_page/begin_screen.dart';
import 'package:burger_app/registration_page/location_page.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';

class FioPage extends StatelessWidget {
  const FioPage({super.key});

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
                child:  Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: whitetext,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 38, bottom: 20),
              child: Text(
                "Введите свои инициалы, чтобы продолжить",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: whitetext),
              ),
            ),
            const Text(
              "ФИО будет использоваться в вашем профиле",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            Container(
              margin: const EdgeInsets.only(top: 47),
              decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(8)),
              child: TextField(
                  style:  TextStyle(color: whitetext, fontSize: 14),
                  cursorColor: maincolor,
                  decoration: InputDecoration(
                      hintText: "Введите имя",
                      hintStyle:
                          TextStyle(color: whitetext, fontSize: 14),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: maincolor, width: 2)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)))),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(8)),
              child: TextField(
                  style:  TextStyle(color: whitetext, fontSize: 14),
                  cursorColor: maincolor,
                  decoration: InputDecoration(
                      hintText: "Введите фамилию",
                      hintStyle:
                           TextStyle(color: whitetext, fontSize: 14),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: maincolor, width: 2)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)))),
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
                        builder: (context) => const LocationPage(),
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
