// Create a ListView in which there are 8 children and each child must be a
// Column widget. In each Column you must have an Image in the Start (The
// image must be of width 80 and height 80) Besides the image there must be
// a Container with a text in the Center and a border to the Container.

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
          body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
              margin: const EdgeInsets.all(10),
              height: 80,
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: const Image(
                      image: NetworkImage(
                          "data:image/jpeg;base64,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"),
                    ),
                  ),
                  const Spacer(
                    flex: 8,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(7)),
                    child: const Text("Core2Web"),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ));
        },
      )),
    );
  }
}
