// Create a Screen that will display the Container in the Center of the
// Screen,
// with size(width: 300, height: 300). The container must have a blue
// color and it must have a border which must be of color red.

import 'package:flutter/material.dart';

void main() {
  runApp(const containerDemo());
}

class containerDemo extends StatelessWidget {
  const containerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true, title: const Text("Container Assignment")),
        body: Center(
            child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(color: Colors.red, width: 3),
          ),
        )),
      ),
    );
  }
}
