import 'package:flutter/material.dart';
import 'package:flutter_ai_assistant/recent_searches.dart';
import 'package:flutter_ai_assistant/screen/talk_to_ai_screen.dart';
import 'package:flutter_ai_assistant/search_bottom_sheet.dart';
import 'package:flutter_ai_assistant/suggestions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AiScreen extends StatefulWidget {
  const AiScreen({super.key});

  @override
  State<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  bool fullScreen = false;
  final txt = TextEditingController();

  sendMessage() {
    print("test");

    if (!fullScreen) {
      fullScreen = true;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              TalkToAiScreen(txt.text, completionFunc, sendMessage),
        ),
      );
    } else {}
  }

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

  Future<String> completionFunc(String text) async {
    print(text);
    print("Hello");

    return await http
        .post(
      Uri.parse("https://api.aimlapi.com/chat/completions"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ef8f39dc1e3d4e158bd494e089c60074"
      },
      body: jsonEncode(
        {
          "model": "gpt-4o",
          "messages": [
            {
              "role": "user",
              "content": text,
            },
          ],
          "max_tokens": 512,
          "stream": false,
        },
      ),
    )
        .then((response) {
      print((jsonDecode(response.body) as Map<String, dynamic>)["choices"][0]
          ["message"]["content"]);

      return (jsonDecode(response.body) as Map<String, dynamic>)["choices"][0]
          ["message"]["content"];
    });
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
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (BuildContext context) {
          return SearchBottomSheet(
            sendMessage,
            txt,
            completionFunc,
          );
        },
      ),
    );
  }
}
