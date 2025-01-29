import 'package:burger_app/registration_page/begin_screen.dart';
import 'package:burger_app/registration_page/login_page.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';

class CongrulationsPage extends StatelessWidget {
  const CongrulationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(left: 25, right: 25),
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 100),
              child: Image(
                image: AssetImage(
                  "images/check.png",
                ),
                width: 320,
              ),
            ),
            Text(
              "Поздравляем!",
              style: TextStyle(
                  fontSize: 36, color: maincolor, fontWeight: FontWeight.bold),
            ),
            Text(
              "Ваш профиль готов к использованию",
              style: TextStyle(color: whitetext, fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Buttons(
                  col: maincolor,
                  texcol: Colors.black,
                  tex: "Далее",
                  tap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        // ignore: prefer_const_constructors
                        builder: (context) => LoginPage(),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
