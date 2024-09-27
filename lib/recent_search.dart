import 'package:flutter/material.dart';

class RecentSearch extends StatelessWidget {
  final String recentSearchText;
  const RecentSearch(this.recentSearchText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          margin: const EdgeInsets.all(6),
          child: const Image(
            image: AssetImage("assets/back-arrow.png"),
          ),
        ),
        Text(
          recentSearchText,
          style: const TextStyle(fontSize: 22),
        ),
      ],
    );
  }
}
