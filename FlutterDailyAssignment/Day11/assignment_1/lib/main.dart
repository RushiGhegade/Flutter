// Create a TextField which must have a rectangular border. Initially, the
// border color of the TextField must be red but when we tap on the TextField
// the border color must turn green.

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
            child: TextField(
              decoration: InputDecoration(
                  // filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
