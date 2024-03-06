//Create a Screen in which we have 3 Containers in a Column each container
//must be of height 100 and width 100. Each container must have an image
//as a child.

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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: Image(
                      image: NetworkImage(
                          "https://render.fineartamerica.com/images/rendered/medium/greeting-card/images/artworkimages/medium/2/beautiful-landscape-gary-page.jpg")),
                ),
                Container(
                  height: 100,
                  width: 100,
                  child: Image(
                      image: NetworkImage(
                          "https://render.fineartamerica.com/images/rendered/medium/greeting-card/images/artworkimages/medium/2/yellowstone-national-park-mammoth-hot-kevin-mcneal.jpg")),
                ),
                Container(
                  height: 100,
                  width: 100,
                  child: Image(
                      image: NetworkImage(
                          "https://render.fineartamerica.com/images/rendered/default/greeting-card/images/artworkimages/medium/2/snowy-yellowstone-jason-maehl.jpg?&targetx=-25&targety=0&imagewidth=750&imageheight=499&modelwidth=700&modelheight=500&backgroundcolor=96969A&orientation=0")),
                ),
              ]),
        ),
      ),
    );
  }
}
