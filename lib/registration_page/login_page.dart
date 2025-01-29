import 'package:burger_app/registration_page/api/user_model.dart';
import 'package:burger_app/registration_page/begin_screen.dart';
import 'package:burger_app/main_page/main_page.dart';
import 'package:burger_app/registration_page/bloc/user_bloc.dart';
import 'package:burger_app/registration_page/otp_page.dart';
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
    // BlocProvider.of<UserBloc>(context).add(UserLoadingData());
    super.initState();
  }

  late Color errorTextColor = whitetext;

  final TextEditingController login =
      TextEditingController(text: "rahimjon@gmail.com");

  final TextEditingController password =
      TextEditingController(text: "rahimjon");

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: maincol2,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    height: 2,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(color: maincolor, width: 3)),
                  ),
                ),
                Text(
                  "Forgot password?",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: whitetext),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    "Select which contact details should we use to reset your password",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: TextField(
                    cursorColor: maincolor,
                    maxLength: 32,
                    style: TextStyle(color: whitetext),
                    decoration: InputDecoration(
                        label: const Text(
                          "Telefon yoki email kiriting",
                        ),
                        labelStyle: const TextStyle(color: Colors.grey),
                        floatingLabelStyle: TextStyle(color: maincolor),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: whitetext)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: maincolor)),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                ),
                Buttons(
                    col: maincolor,
                    texcol: maincol1,
                    tex: "Davom ettirish",
                    tap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OtpScreen(),
                        ),
                      );
                    })
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MainPage(),
              ),
            );
          } else {
            setState(() {
              errorTextColor = Colors.red;
            });
          }
        },
        builder: (context, state) {
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
                const Text(
                  "Войдите, чтобы продолжить",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 48, bottom: 21),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: login,
                    style: TextStyle(
                      color: whitetext,
                    ),
                    cursorColor: maincolor,
                    decoration: InputDecoration(
                      hintText: "rahimjon@gmail.com",
                      hintStyle: TextStyle(color: errorTextColor),
                      prefixIcon: Icon(
                        Icons.send_rounded,
                        color: maincolor,
                        size: 24,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: maincolor,
                          width: 2,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: password,
                    style: TextStyle(
                      color: whitetext,
                    ),
                    cursorColor: maincolor,
                    decoration: InputDecoration(
                      hintText: "* * * * * * * *",
                      hintStyle: TextStyle(color: errorTextColor),
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
                        borderSide: BorderSide(color: maincolor, width: 2),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 44, bottom: 32),
                  child: TextButton(
                      onPressed: () {
                        _showBottomSheet(context);
                      },
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
                  isLoading: state is UserLoading,
                  tap: () {
                    context.read<UserBloc>().add(
                          UserLoginEvent(
                            model: UserModel(
                              email: login.text,
                              password: password.text,
                            ),
                          ),
                        );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const MainPage(),
                    //   ),
                    // );
                    // if (state is UserSucces) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const MainPage(),
                    //   ),
                    // );
                    // } else if (state is UserError) {
                    //   setState(() {
                    //     errortextcolor = Colors.red;
                    //   });
                    // }
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
