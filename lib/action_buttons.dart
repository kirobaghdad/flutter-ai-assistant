import 'package:flutter/material.dart';

class ActionButtons extends StatefulWidget {
  const ActionButtons({super.key});

  @override
  State<ActionButtons> createState() => _ActionButtonsState();
}

class _ActionButtonsState extends State<ActionButtons> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          height: 50,
          width: 130,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: SizedBox(
                  width: 60,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/mic.png"),
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/camera.png"),
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          height: 50,
          child: IconButton(
            onPressed: () {},
            icon: Image.asset('assets/send.png'),
          ),
        ),
      ],
    );
  }
}
