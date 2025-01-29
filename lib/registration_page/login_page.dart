import 'package:burger_app/registration_page/begin_screen.dart';
import 'package:burger_app/main_page/main_page.dart';
import 'package:burger_app/registration_page/bloc/user_bloc.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(UserLoadingData());
    super.initState();
  }

  final TextEditingController login = TextEditingController();

  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserSucces) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainPage(),
                ));
          }
          if (state is UserError) {
            return Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/burger.webp"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 103, bottom: 28),
                    child: Text(
                      "BURGER BAR",
                      style: TextStyle(
                          fontSize: 52,
                          fontWeight: FontWeight.bold,
                          color: whitetext),
                    ),
                  ),
                  Text(
                    "Войдите в свой профиль",
                    style: TextStyle(
                      color: whitetext,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text("Войдите, чтобы продолжить",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w400)),
                  Container(
                    margin: const EdgeInsets.only(top: 48, bottom: 21),
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(8)),
                    child: TextField(
                      controller: login,
                      style: TextStyle(
                        color: whitetext,
                      ),
                      cursorColor: maincolor,
                      decoration: InputDecoration(
                          hintText: "rahimjon@gmail.com",
                          hintStyle: const TextStyle(color: Colors.red),
                          prefixIcon: Icon(
                            Icons.send_rounded,
                            color: maincolor,
                            size: 24,
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(8)),
                    child: TextField(
                      controller: password,
                      style: TextStyle(
                        color: whitetext,
                      ),
                      cursorColor: maincolor,
                      decoration: InputDecoration(
                          hintText: "* * * * * * * *",
                          hintStyle: const TextStyle(color: Colors.red),
                          prefixIcon: const Icon(
                            Icons.shield_rounded,
                            color: Colors.red,
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
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 33, bottom: 45),
                    child: Text(
                      "Или продолжите с помощью  ",
                      style: TextStyle(
                          color: whitetext,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
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
                              Text(
                                "  Facebook",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: whitetext),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
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
                              Text(
                                "Google",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: whitetext),
                              )
                            ],
                          ),
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
                    },
                  )
                ],
              ),
            );
          }
          return Container(
            padding: const EdgeInsets.only(left: 25, right: 25),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/burger.webp"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 103, bottom: 28),
                  child: Text(
                    "BURGER BAR",
                    style: TextStyle(
                        fontSize: 52,
                        fontWeight: FontWeight.bold,
                        color: whitetext),
                  ),
                ),
                Text(
                  "Войдите в свой профиль",
                  style: TextStyle(
                    color: whitetext,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text("Войдите, чтобы продолжить",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w400)),
                Container(
                  margin: const EdgeInsets.only(top: 48, bottom: 21),
                  decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(8)),
                  child: TextField(
                    controller: login,
                    style: TextStyle(
                      color: whitetext,
                    ),
                    cursorColor: maincolor,
                    decoration: InputDecoration(
                        hintText: "rahimjon@gmail.com",
                        hintStyle: TextStyle(color: whitetext),
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
                    controller: password,
                    style: TextStyle(
                      color: whitetext,
                    ),
                    cursorColor: maincolor,
                    decoration: InputDecoration(
                        hintText: "* * * * * * * *",
                        hintStyle: TextStyle(color: whitetext),
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
                Padding(
                  padding: const EdgeInsets.only(top: 33, bottom: 45),
                  child: Text(
                    "Или продолжите с помощью  ",
                    style: TextStyle(
                        color: whitetext,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
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
                            Text(
                              "  Facebook",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: whitetext),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
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
                            Text(
                              "Google",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: whitetext),
                            )
                          ],
                        ),
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
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

