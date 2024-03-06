//Create a Screen, in the appBar display "Profile Information". In the body,
//display an image of size (height: 250 width:250). Below the image add
//appropriate spacing and then display the user Name and Phone Number
//vertically. The name and phone number must have a font size of 16 and a font
//weight of 500.

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
        appBar:
            AppBar(title: const Text("Profile Information"), centerTitle: true),
        body: const Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                  image: NetworkImage(
                      "https://render.fineartamerica.com/images/rendered/medium/greeting-card/images/artworkimages/medium/2/beautiful-landscape-gary-page.jpg"),
                  height: 250,
                  width: 250),
              SizedBox(height: 20),
              Text("Rushikesh Ghegade",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              SizedBox(height: 20),
              Text("8530321810",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }
}
