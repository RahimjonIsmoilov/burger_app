import 'package:flutter/material.dart';

class SpecialOrder extends StatelessWidget {
  const SpecialOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Все"),
        Text("Доставляется"),
        Text("Доставлено"),
      ],
    );
  }
}
