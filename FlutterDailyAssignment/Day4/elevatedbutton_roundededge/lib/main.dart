//Create an ElevatedButton, in the centre of the screen. The button must
//have rounded edges. Give a shadow of color red to the button.

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
             
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child: const Text("Button", style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
