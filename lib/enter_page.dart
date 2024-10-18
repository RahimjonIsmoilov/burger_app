import 'package:burger_app/begin_screen.dart';
import 'package:burger_app/main_page/main_page.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';

class EnterPage extends StatelessWidget {
  const EnterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(left: 25, right: 25),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/burger.webp"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 103, bottom: 28),
              child: Text(
                "BURGER BAR",
                style: TextStyle(
                    fontSize: 52,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const Text(
              "Войдите в свой профиль",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text("Войдите, чтобы продолжить",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w400)),
            Container(
              margin: const EdgeInsets.only(top: 48, bottom: 21),
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(8)),
              child: TextField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                cursorColor: maincolor,
                decoration: InputDecoration(
                    hintText: "rahimjon@gmail.com",
                    hintStyle: const TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.send_rounded,
                      color: maincolor,
                      size: 24,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: maincolor, width: 2)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(8)),
              child: TextField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                cursorColor: maincolor,
                decoration: InputDecoration(
                    hintText: "* * * * * * * *",
                    hintStyle: const TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.shield_rounded,
                      color: maincolor,
                      size: 24,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: maincolor,
                        size: 24,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: maincolor, width: 2)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 33, bottom: 45),
              child: Text(
                "Или продолжите с помощью  ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 56,
                  width: 153,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.facebook,
                        color: maincolor,
                        size: 30,
                      ),
                      const Text(
                        "  Facebook",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 56,
                  width: 153,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.g_mobiledata_rounded,
                        color: maincolor,
                        size: 48,
                      ),
                      const Text(
                        "Google",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 44, bottom: 32),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Забыли пароль?",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: maincolor),
                  )),
            ),
            Buttons(
                col: maincolor,
                texcol: Colors.black,
                tex: "Войти",
                tap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainPage(),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
