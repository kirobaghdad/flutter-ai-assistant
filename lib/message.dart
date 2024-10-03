import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class Message extends StatelessWidget {
  final String text;
  final bool myMessage;
  const Message(this.text, this.myMessage, {super.key});

  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      text: text,
      color: myMessage
          ? const Color(0xFF1B97F3)
          : const Color.fromARGB(255, 224, 88, 78),
      tail: false,
      isSender: myMessage,
      textStyle: const TextStyle(color: Colors.white, fontSize: 16),
    );
  }
}
