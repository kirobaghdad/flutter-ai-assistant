import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class AiMessage extends StatelessWidget {
  final String message;
  const AiMessage(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(message),
    );
  }
}
