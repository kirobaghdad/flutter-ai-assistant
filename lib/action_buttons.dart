import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ActionButtons extends StatefulWidget {
  final getText;
  final sendMessage;

  ActionButtons(this.getText, this.sendMessage, {super.key});

  @override
  State<ActionButtons> createState() => _ActionButtonsState();
}

class _ActionButtonsState extends State<ActionButtons> {
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult, localeId: 'en-US');
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    print(_lastWords);

    widget.getText(_lastWords);
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    print("Hello");

    setState(() {
      print("Hello");
      _lastWords = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
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
                    onPressed: () {
                      _speechToText.isNotListening
                          ? _startListening()
                          : _stopListening();
                    },
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
            onPressed: () => widget.sendMessage(),
            icon: Image.asset('assets/send.png'),
          ),
        ),
      ],
    );
  }
}


  // String? _audioPath = "";

  // String _generateRandomId() {
  //   const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  //   final random = Random();
  //   return List.generate(
  //     10,
  //     (index) => chars[random.nextInt(chars.length)],
  //     growable: false,
  //   ).join();
  // }

  // Future<void> _stopRecording() async {
  //   try {
  //     String? path = await record.stop();

  //     setState(() {
  //       _audioPath = path;
  //     });

  //     debugPrint('=========>>>>>> PATH: $_audioPath <<<<<<===========');
  //   } catch (e) {
  //     debugPrint('ERROR WHILE STOP RECORDING: $e');
  //   }
  // }

  // void getAudio() async {
  //   if (await record.hasPermission()) {
  //     // Start recording to file

  //     if (_isRecording == false) {
  //       String filePath = await getApplicationDocumentsDirectory()
  //           .then((value) => '${value.path}/${_generateRandomId()}.m4a');

  //       setState(() {
  //         _isRecording = true;
  //       });
  //       await record.start(const RecordConfig(), path: filePath);
  //     } else {
  //       _stopRecording();

  //       setState(() {
  //         _isRecording = false;
  //       });
  //     }
  //   }
  // }
