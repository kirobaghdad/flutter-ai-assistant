import 'package:flutter/material.dart';
import 'package:flutter_ai_assistant/ai_message.dart';
import 'package:flutter_ai_assistant/message.dart';

class Messages extends StatefulWidget {
  final String startMessage;
  final Function completionFunc;
  const Messages(this.startMessage, this.completionFunc, {super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  List<String> messages = [];

  getResponse() async {
    print("Hello World!");

    String response = await widget.completionFunc(widget.startMessage);

    setState(() {
      messages.add(response);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Hello World 1!");

    messages.add(widget.startMessage);
    getResponse();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return Message(messages[index], index % 2 == 0);
      },
    );
  }
}
