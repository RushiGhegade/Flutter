//Create an Elevated button in the Center of the Screen. Decorate the button as
//follows.
//a. The button must be of Circular Shape.
//b. The Size of the button must be (width:200, height: 200).
//c. The button must have a border of color red.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(100, 100),
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(20)),
            ),
            onPressed: () {},
            child: const Text("Button"),
          ),
        ),
      ),
    );
  }
}
