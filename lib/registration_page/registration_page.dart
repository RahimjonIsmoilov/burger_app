import 'package:burger_app/registration_page/api/user_model.dart';
import 'package:burger_app/registration_page/begin_screen.dart';
import 'package:burger_app/registration_page/bloc/user_bloc.dart';
import 'package:burger_app/registration_page/fio_page.dart';
import 'package:burger_app/registration_page/login_page.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _obscureConfirmPassword = true;
  late final TextEditingController emaile =
      TextEditingController(text: "rahimjoni@gmail.com");
  late final TextEditingController phone =
      TextEditingController(text: "998915568989");
  late final TextEditingController password =
      TextEditingController(text: "123456");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          // Agar foydalanuvchi ro'yxatdan o'tgan bo'lsa, keyingi sahifaga o'tamiz
          if (state is UserSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FioPage()),
            );
          }
          // Xatolik yuzaga kelgan bo'lsa, xabar ko'rsatamiz
          if (state is UserError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text("Ro'yxatdan o'tishda xatolik yuz berdi!")),
            );
          }
        },
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/burgerwaiter.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100, bottom: 38),
                    child: Text(
                      "BURGER BAR",
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: whitetext,
                      ),
                    ),
                  ),
                  Text(
                    "Создать аккаунт",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: whitetext,
                    ),
                  ),
                  const Text(
                    "Зарегистрируйтесь, чтобы продолжить",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  // Email maydoni
                  Container(
                    margin: const EdgeInsets.only(top: 48),
                    width: 325,
                    height: 56,
                    decoration: const BoxDecoration(color: Colors.black87),
                    child: TextField(
                      controller: emaile,
                      cursorColor: whitetext,
                      decoration: InputDecoration(
                        hintText: "rahimjon@gmail.com",
                        hintStyle: TextStyle(
                          color: whitetext,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        prefixIcon: Icon(
                          Icons.send_rounded,
                          color: maincolor,
                          size: 24,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: maincolor),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      style: TextStyle(color: whitetext, fontSize: 14),
                    ),
                  ),
                  // Telefon raqam maydoni
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    width: 325,
                    height: 56,
                    decoration: const BoxDecoration(color: Colors.black87),
                    child: TextField(
                      controller: phone,
                      keyboardType: TextInputType.phone,
                      cursorColor: whitetext,
                      decoration: InputDecoration(
                        hintText: "+998901234567",
                        hintStyle: TextStyle(
                          color: whitetext,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        prefixIcon: Icon(
                          Icons.phone_rounded,
                          color: maincolor,
                          size: 24,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: maincolor),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      style: TextStyle(color: whitetext, fontSize: 14),
                    ),
                  ),
                  // Parol maydoni
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    width: 325,
                    height: 56,
                    decoration: const BoxDecoration(color: Colors.black87),
                    child: TextField(
                      controller: password,
                      obscureText: _obscureConfirmPassword,
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: whitetext,
                      decoration: InputDecoration(
                        hintText: "••••••",
                        hintStyle: TextStyle(
                          color: whitetext,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword;
                            });
                          },
                          icon: _obscureConfirmPassword
                              ? const Icon(Icons.remove_red_eye_outlined)
                              : const Icon(Icons.remove_red_eye_rounded),
                          iconSize: 24,
                          color: maincolor,
                        ),
                        prefixIcon: Icon(
                          Icons.shield,
                          color: maincolor,
                          size: 24,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: maincolor),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      style: TextStyle(color: whitetext, fontSize: 14),
                    ),
                  ),
                  // Ro'yxatdan o'tish tugmasi
                  Padding(
                    padding: const EdgeInsets.only(top: 179),
                    child: Buttons(
                      col: maincolor,
                      isLoading: state is UserLoading,
                      texcol: Colors.black,
                      tex: "создать аккаунт",
                      tap: () {
                        // Validatsiya qilamiz
                        if (_validateInputs()) {
                          context.read<UserBloc>().add(
                                UserRegisterEvent(
                                  model: UserModel(
                                    email: emaile.text,
                                    phonenumber: int.parse(phone
                                        .text), // String sifatida jo'natiladi
                                    password: password.text,
                                    name: "nk",
                                    address: "jui",
                                  ),
                                ),
                              );
                        }
                      },
                    ),
                  ),
                  // Kirish tugmasi
                  Padding(
                    padding: const EdgeInsets.only(left: 54, top: 13),
                    child: Row(
                      children: [
                        Text(
                          "Уже есть аккаунт? ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: whitetext,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          },
                          child: Text(
                            " Войти",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: maincolor,
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
        },
      ),
    );
  }

  // Validatsiya funksiyasi
  bool _validateInputs() {
    if (emaile.text.isEmpty || !emaile.text.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Iltimos, to'g'ri email kiriting!")),
      );
      return false;
    }
    if (phone.text.isEmpty || phone.text.length < 9) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Iltimos, to'g'ri telefon raqam kiriting!")),
      );
      return false;
    }
    if (password.text.isEmpty || password.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Parol kamida 6 ta belgidan iborat bo'lishi kerak!")),
      );
      return false;
    }
    return true;
  }
}
