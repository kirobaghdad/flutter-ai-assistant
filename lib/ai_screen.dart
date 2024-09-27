import 'package:flutter/material.dart';
import 'package:flutter_ai_assistant/recent_searches.dart';
import 'package:flutter_ai_assistant/search_bottom_sheet.dart';
import 'package:flutter_ai_assistant/suggestions.dart';

class AiScreen extends StatefulWidget {
  const AiScreen({super.key});

  @override
  State<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  String getGreetingText() {
    int hour = DateTime.now().hour;
    String greetingText = "";

    if (hour > 6 && hour < 12)
      greetingText = "Good Morning";
    else if (hour > 12 && hour < 18)
      greetingText = "Good Afternoon";
    else
      greetingText = "Good Evening";

    return greetingText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 90),
            child: Text(
              getGreetingText(),
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Suggestions(),
          Text("Recent"),
          RecentSearches(),
        ],
      ),
      bottomSheet: SearchBottomSheet(),
    );
  }
}
