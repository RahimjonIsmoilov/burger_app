import 'package:burger_app/registration_page/begin_screen.dart';
import 'package:burger_app/registration_page/reset_password_page.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackButton(
          color: whitetext,
        ),
        title: const Text(
          "Bir martalik parol",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Email Tasdiqlash",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Tasdiqlash kodingizni kiriting. Biz uni emailingizga yubordik: rahimjon******@gmail.com",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 30),
            Pinput(
              length: 4,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: BoxDecoration(
                  border: Border.all(color: maincolor),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              // ignore: avoid_print
              onCompleted: (pin) => print("Entered PIN: $pin"),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Kodni olmadingizmi ? ",
                  style: TextStyle(color: Colors.white70),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Qayta yuborish",
                    style: TextStyle(color: maincolor, fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.access_time, color: Colors.white70),
                SizedBox(width: 5),
                Text("9:00")
              ],
            ),
            const Spacer(),
            Buttons(
                col: maincolor,
                texcol: maincol1,
                tex: "Davom ettirish",
                tap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResetPasswordPage(),
                      ));
                })
          ],
        ),
      ),
    );
  }
}
