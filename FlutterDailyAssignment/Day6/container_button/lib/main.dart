// Create a screen that displays a container. The container must display an image.
// Give a circular border only at the bottom of the container. Below the container
// display the button with size:(width:250, height:70). The button must display
// “Add to cart”. The color of the button must be purple. Both the container and
// button must be in the center of the screen.

import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                        image: NetworkImage(
                            "data:image/jpeg;base64,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"),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    fixedSize: const Size(250, 70),
                    backgroundColor: Colors.purple),
                onPressed: () {},
                child: const Text(
                  "Add to cart",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
