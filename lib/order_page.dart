import 'package:flutter/material.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TabBar(tabs: [
        Text("Все"),
        Text("Доставляется"),
        Text("Доставлено"),
      ]),
    );
  }
}
