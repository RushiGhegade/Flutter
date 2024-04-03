// Create a Textfield and display the hint as shown in the image, also allow
// the user to type 20 characters only and display the count of the characters.

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  State createState() => _MyAppState();
}

String _enteredText = "";

class _MyAppState extends State {
  // const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: TextField(
              maxLength: 20,
              onChanged: (value) {
                _enteredText = value;
                setState(() {});
              },
              decoration: InputDecoration(
                  counterText: "${_enteredText.length}/20",
                  label: const Text("Enter Name"),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
        ),
      ),
    );
  }
}
