import 'package:flutter/material.dart';
import 'package:flutter_ai_assistant/messages.dart';
import 'package:flutter_ai_assistant/search_bottom_sheet.dart';

class TalkToAiScreen extends StatefulWidget {
  final String startMessage;
  final Function completionFunc;
  final sendMessage;
  const TalkToAiScreen(this.startMessage, this.completionFunc, this.sendMessage,
      {super.key});

  @override
  State<TalkToAiScreen> createState() => _TalkToAiScreenState();
}

class _TalkToAiScreenState extends State<TalkToAiScreen> {
  List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello"),
      ),
      body: Column(
        children: [
          Messages(widget.startMessage, widget.completionFunc),
        ],
      ),
      bottomSheet:
          SearchBottomSheet(widget.sendMessage, txt, widget.completionFunc),
    );
  }
}
