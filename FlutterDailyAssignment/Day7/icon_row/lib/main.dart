// Create a Screen that displays an `Icon` widget representing a star the size of the
// icon must be 40 and the color of the icon must be orange, beside the icon place a
// `Text` widget with the content "Rating: 4.5". Apply a font size of 25 and bold
// weight to the text. Refer to below image.

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
            height: 50,
            width: 160,
            decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Rating: 4.5")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
