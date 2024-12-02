import 'package:burger_app/enter_page.dart';
import 'package:burger_app/registration_page.dart';
import 'package:flutter/material.dart';

class BeginScreen extends StatelessWidget {
  const BeginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          height: 812,
          width: 375,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/burgerwaiter.jpg"))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 170),
                child: Text("BURGER BAR",
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 300),
                child: Text(
                    "Вкусный бургер — это то,что вы заслуживаетездесь и сейчас",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Buttons(
                  col: const Color.fromARGB(255, 234, 182, 23),
                  texcol: Colors.black,
                  tex: "Войти",
                  tap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EnterPage(),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Buttons(
                  col: Colors.white,
                  texcol: const Color.fromARGB(255, 234, 182, 23),
                  tex: "Зарегистрироваться",
                  tap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.col,
    required this.texcol,
    required this.tex,
    required this.tap,
  });
  final Function tap;
  final String tex;
  final Color texcol;
  final Color col;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        tap();
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: col,
            borderRadius: const BorderRadius.all(Radius.circular(25))),
        child: Align(
          alignment: Alignment.center,
          child: Text(tex,
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: texcol)),
        ),
      ),
    );
  }
}
