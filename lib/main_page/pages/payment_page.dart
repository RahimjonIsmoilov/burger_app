import 'package:burger_app/main_page/pages/order_tracker.dart';
import 'package:burger_app/registration_page/begin_screen.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isCardSelected = true;
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      backgroundColor: maincol2,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 400,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  height: 2,
                  width: 150,
                  decoration: BoxDecoration(
                      border: Border.all(color: maincolor, width: 3)),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Image(image: AssetImage("images/succespassword.png")),
                ),
                const Text(
                  "Muavfaqiyatli to'landi",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Buttons(
                      col: maincolor,
                      texcol: maincol1,
                      tex: "Davom ettirish",
                      tap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TrackOrderPage(),
                          ),
                        );
                      }),
                )
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
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("To'lov",
              style: TextStyle(color: whitetext, fontWeight: FontWeight.bold)),
          leading: BackButton(
            color: whitetext,
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("To'lov turini tanlang",
                style: TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildPaymentButton("Karta", Icons.credit_card, isCardSelected),
                const SizedBox(width: 10),
                _buildPaymentButton(
                    "Naqd", Icons.attach_money, !isCardSelected),
              ],
            ),
            const SizedBox(height: 20),
            _buildCardInfo(),
            const SizedBox(height: 20),
            const Text("Yetkazish usulini tanlang",
                style: TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildDeliveryButton("Uyga", Icons.home, true),
                const SizedBox(width: 10),
                _buildDeliveryButton("Do'kondan", Icons.store, false),
              ],
            ),
            const SizedBox(height: 20),
            _buildCostDetails(),
            const Spacer(),
            Buttons(
                col: maincolor,
                texcol: maincol1,
                tex: "To'lash",
                tap: () {
                  _showBottomSheet(
                    context,
                  );
                }),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentButton(String text, IconData icon, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isCardSelected = text == "Karta";
          });
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.yellow : Colors.grey[800],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: isSelected ? Colors.black : Colors.white),
              const SizedBox(width: 5),
              Text(text,
                  style: TextStyle(
                      color: isSelected ? Colors.black : Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardInfo() {
    return Container(
      height: 172,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: maincolor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 23, left: 29),
            child: const Row(
              children: [
                Image(
                  image: AssetImage("images/humocard.png"),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            height: 94,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24)),
              color: maincol2,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "5689 **** **** 5698",
                  style: TextStyle(
                      color: whitetext,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ismoilov Rahimjon",
                      style: TextStyle(
                          color: whitetext,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "05/24",
                      style: TextStyle(
                          color: whitetext,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryButton(String text, IconData icon, bool isSelected) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.yellow : Colors.grey[800],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? Colors.black : Colors.white),
            const SizedBox(width: 5),
            Text(text,
                style:
                    TextStyle(color: isSelected ? Colors.black : Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildCostDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCostRow("Products Price:", "\$1327.00"),
        _buildCostRow("Shipping Fees:", "\$5.00"),
        const Divider(color: Colors.white),
        _buildCostRow("Total Cost", "\$1332.00", isBold: true),
      ],
    );
  }

  Widget _buildCostRow(String label, String price, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(color: Colors.white70, fontSize: 16)),
          Text(price,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: isBold ? 18 : 16,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
