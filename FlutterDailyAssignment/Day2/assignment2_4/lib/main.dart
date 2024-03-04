// Create a container that will have a border. The top right and bottom left corners
// of the border must be rounded. Now display the Text in the Container and give
// appropriate padding to the container.

import 'package:flutter/material.dart';

void main() {
  runApp(const Demo());
}

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Container Demo")),
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                border: Border.all(width: 2)),
            padding: const EdgeInsets.all(20),
            child: const Text("Container Demo"),
          ),
        ),
      ),
    );
  }
}
