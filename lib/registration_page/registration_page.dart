import 'package:burger_app/registration_page/begin_screen.dart';
import 'package:burger_app/registration_page/enter_page.dart';
import 'package:burger_app/registration_page/fio_page.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage("images/burgerwaiter.jpg"))),
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100, bottom: 38),
                child: Text("BURGER BAR",
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: whitetext)),
              ),
              Text(
                "Создать аккаунт",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: whitetext),
              ),
              const Text(
                "Зарегистрируйтесь, чтобы продолжить",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              Container(
                margin: const EdgeInsets.only(top: 48),
                width: 325,
                height: 56,
                decoration: const BoxDecoration(color: Colors.black87),
                child: TextField(
                  cursorColor: whitetext,
                  decoration: InputDecoration(
                    hintText: "rahimjon@gmail.com",
                    hintStyle: TextStyle(
                        color: whitetext,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    prefixIcon: Icon(
                      Icons.send_rounded,
                      color: maincolor,
                      size: 24,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: maincolor)),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  style: TextStyle(color: whitetext, fontSize: 14),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                width: 325,
                height: 56,
                decoration: const BoxDecoration(color: Colors.black87),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  cursorColor: whitetext,
                  decoration: InputDecoration(
                    hintText: "+998901234567",
                    hintStyle: TextStyle(
                        color: whitetext,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    prefixIcon: Icon(
                      Icons.phone_rounded,
                      color: maincolor,
                      size: 24,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: maincolor)),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  style: TextStyle(color: whitetext, fontSize: 14),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                width: 325,
                height: 56,
                decoration: const BoxDecoration(color: Colors.black87),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: whitetext,
                  decoration: InputDecoration(
                    hintText: "* * * * * * * *",
                    hintStyle: TextStyle(
                        color: whitetext,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_red_eye_outlined),
                      iconSize: 24,
                      color: maincolor,
                    ),
                    prefixIcon: Icon(
                      Icons.shield,
                      color: maincolor,
                      size: 24,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: maincolor)),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  style: TextStyle(color: whitetext, fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 179),
                child: Buttons(
                    col: maincolor,
                    texcol: Colors.black,
                    tex: "создать аккаунт",
                    tap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FioPage(),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 54, top: 13),
                child: Row(
                  children: [
                    Text(
                      "Уже есть аккаунт? ",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: whitetext),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EnterPage(),
                          ),
                        );
                      },
                      child: Text(
                        " Войти",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: maincolor),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
