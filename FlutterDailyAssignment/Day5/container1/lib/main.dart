//Create a Screen and add your image in the center of the screen below your
//image display your name in a container, give a shadow to the Container
//and give a border to the container the top left and top right corners must
//be circular, with a radius of 20. Add appropriate padding to the container.

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
          child: Column(
            children: [
              const Image(
                  image: NetworkImage(
                      "https://render.fineartamerica.com/images/rendered/default/greeting-card/images/artworkimages/medium/2/snowy-yellowstone-jason-maehl.jpg?&targetx=-24&targety=0&imagewidth=749&imageheight=500&modelwidth=700&modelheight=500&backgroundcolor=96969A&orientation=0")),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.red,
                        offset: Offset(10, 10),
                        blurRadius: 10)
                  ],
                  border: Border.all(width: 1),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: const Text("Rushikesh Ghegade"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
