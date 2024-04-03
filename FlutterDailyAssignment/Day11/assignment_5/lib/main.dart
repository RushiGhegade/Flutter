// Create a TextField which must take a certain height. Also, change the color
// of the cursor to red. The height of the text field must be given using the
// parameter present inside the Textfield i.e. do not use a sized box or any
// other widget to give size to the Textfield.

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Center(
            child: SizedBox(
              height: 100,
              child: TextField(
                maxLines: 10,
                decoration: InputDecoration(
                    label: const Text("Enter your Name"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
