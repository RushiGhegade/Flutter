// Create a Circular Container and give the Container 2 colors i.e. red and
// blue. 50 % of the container must contain red and the other 50 % must
// contain blue color.
// (Note: The transition from the Red color to blue must be sharp)

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Container(
          width: 190,
          height: 190,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1),
              gradient: const LinearGradient(
                  colors: [Colors.red, Colors.blue], stops: [0.5, 0.5])),
        ),
      )),
    );
  }
}
