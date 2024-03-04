//Add a container in the center of the screen with a size(width: 200,
//height: 200). Give a red border to the container. Now when the user taps
//the container change the color of the border to green.

import 'package:flutter/material.dart';

void main() {
  runApp(const Myclass());
}

class Myclass extends StatefulWidget {
  const Myclass({super.key});

  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () {
              flag = !flag;
              setState(() {});
            },
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 3, color: (flag) ? Colors.red : Colors.blue),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
