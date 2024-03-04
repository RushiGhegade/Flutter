//Create a Container with size(height:200, width:300) now give a shadow to
//the container but the shadow must only be at the top side of the container.

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
          child: Container(
            height: 200,
            width: 300,
            decoration: const BoxDecoration(
              color: Colors.red,
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, -10),
                    blurRadius: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
