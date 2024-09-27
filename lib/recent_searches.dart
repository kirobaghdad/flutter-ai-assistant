import 'package:flutter/material.dart';
import 'package:flutter_ai_assistant/recent_search.dart';

class RecentSearches extends StatefulWidget {
  const RecentSearches({super.key});

  @override
  State<RecentSearches> createState() => _RecentSearchesState();
}

class _RecentSearchesState extends State<RecentSearches> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(3, (i) {
        return const RecentSearch("Hello");
      }),
    );
  }
}
