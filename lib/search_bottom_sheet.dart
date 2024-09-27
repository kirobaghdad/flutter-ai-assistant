import 'package:flutter/material.dart';
import 'package:flutter_ai_assistant/action_buttons.dart';

class SearchBottomSheet extends StatefulWidget {
  const SearchBottomSheet({super.key});

  @override
  State<SearchBottomSheet> createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const SizedBox(
        height: 250,
        child: Column(
          children: [
            SizedBox(
              height: 180,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    hintText: "Type, talk, or share a photo",
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            ActionButtons()
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
