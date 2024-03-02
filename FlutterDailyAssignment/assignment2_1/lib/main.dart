// Create a screen that displays the container in the center having size (height:
// 200, width: 200). The Container must have border with rounded edges. The
// border must be of the color red. Display a Text in the center of the container.

import 'package:flutter/material.dart';

void main() {
  runApp(const containerDemo());
}

class containerDemo extends StatelessWidget {
  const containerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Container Demo"),
        ),
        body: Center(
          child: Container(
            alignment: Alignment.center,
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: 2, color: Colors.red)),
            child: const Text("Container"),
          ),
        ),
      ),
    );
  }
}
