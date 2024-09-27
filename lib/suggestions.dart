import 'package:flutter/material.dart';
import 'package:flutter_ai_assistant/Suggestion.dart';

class Suggestions extends StatefulWidget {
  const Suggestions({super.key});

  @override
  State<Suggestions> createState() => _SuggestionsState();
}

class _SuggestionsState extends State<Suggestions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(4),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(4, (i) {
          return const Suggestion("Hello");
        }),
      ),
    );
  }
}
