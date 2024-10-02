import 'package:flutter/material.dart';
import 'dart:math';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class ActionButtons extends StatefulWidget {
  const ActionButtons({super.key});

  @override
  State<ActionButtons> createState() => _ActionButtonsState();
}

class _ActionButtonsState extends State<ActionButtons> {
  final record = AudioRecorder();

  bool _isRecording = false;

  String? _audioPath = "";

  String _generateRandomId() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return List.generate(
      10,
      (index) => chars[random.nextInt(chars.length)],
      growable: false,
    ).join();
  }

  Future<void> _stopRecording() async {
    try {
      String? path = await record.stop();

      setState(() {
        _audioPath = path;
      });

      debugPrint('=========>>>>>> PATH: $_audioPath <<<<<<===========');
    } catch (e) {
      debugPrint('ERROR WHILE STOP RECORDING: $e');
    }
  }

  void getAudio() async {
    if (await record.hasPermission()) {
      // Start recording to file

      if (_isRecording == false) {
        String filePath = await getApplicationDocumentsDirectory()
            .then((value) => '${value.path}/${_generateRandomId()}.m4a');

        setState(() {
          _isRecording = true;
        });

        await record.start(const RecordConfig(), path: filePath);
      } else {
        _stopRecording();

        setState(() {
          _isRecording = false;
        });
      }
    }
  }

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
                    onPressed: getAudio,
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
