import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';

class SetList extends StatelessWidget {
  const SetList({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  final Icon icon;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  height: 34,
                  width: 34,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: maincol1),
                  ),
                  child: icon),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  )
                ],
              ),
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.navigate_next_rounded,
                color: Colors.white,
                size: 32,
              ))
        ],
      ),
    );
  }
}
