import 'package:flutter/material.dart';

class Suggestion extends StatelessWidget {
  final String text;
  // final Image image;
  const Suggestion(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                height: 50,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/camera.png",
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
