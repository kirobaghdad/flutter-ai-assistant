import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ai_assistant/action_buttons.dart';
import 'package:http/http.dart' as http;

class SearchBottomSheet extends StatefulWidget {
  Function sendMessage;
  Function completionFunc;
  TextEditingController txt;

  SearchBottomSheet(this.sendMessage, this.txt, this.completionFunc,
      {super.key});

  @override
  State<SearchBottomSheet> createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {
  String resposeText = "";

  void getText(String txt) {
    widget.txt.text = txt;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 180,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  maxLines: null,
                  expands: true,
                  decoration: const InputDecoration(
                    hintText: "Type, talk, or share a photo",
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 25),
                  controller: widget.txt,
                ),
              ),
            ),
            ActionButtons(
              getText,
              widget.sendMessage,
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(4),
        child: SizedBox(
          height: 35,
          // alignment: Alignment.centerRight,
          child: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {},
              icon: Image.asset("assets/expand.png"),
            ),
          ),
        ),
      )
    ]);
  }
}
