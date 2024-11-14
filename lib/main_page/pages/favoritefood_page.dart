import 'package:flutter/material.dart';

class FavoriteFoodPage extends StatelessWidget {
  const FavoriteFoodPage({super.key});

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
