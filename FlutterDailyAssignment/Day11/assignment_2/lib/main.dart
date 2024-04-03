// Create a TextField which must have a rectangular border and at the end of
// the TextField initially display a lock Icon. When we tap the TextField 2
// icons must be displayed at the end of the textfield i.e a lock icon and a
// search icon.

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
                suffixIcon: Icon(Icons.lock),
                suffix: Row(
                  children: [
                    Spacer(
                      flex: 2,
                    ),
                    Icon(
                      Icons.search,
                      size: 28,
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
