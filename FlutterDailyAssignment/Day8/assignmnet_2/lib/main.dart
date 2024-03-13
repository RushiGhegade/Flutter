// Create a Screen in which you will have to display the image of food items
// and below the image display the name of that food item.
// Display 10 such images.The scrolling direction must be horizontal
// (refer to the below image

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
          appBar: AppBar(
            title: const Text("Show Images Horizontaly"),
          ),
          body: const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 18),
              child: Row(
                children: [
                  Column(
                    children: [
                      Image(
                        image: NetworkImage(
                            "https://media.istockphoto.com/id/938742222/photo/cheesy-pepperoni-pizza.jpg?s=612x612&w=0&k=20&c=D1z4xPCs-qQIZyUqRcHrnsJSJy_YbUD9udOrXpilNpI="),
                        height: 200,
                        width: 200,
                      ),
                      Text(
                        "PIZZA",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image(
                        image: NetworkImage(
                            "data:image/jpeg;base64,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"),
                        height: 200,
                        width: 200,
                      ),
                      Text(
                        "Burger",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image(
                        image: NetworkImage(
                            // "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"),
                            "https://hips.hearstapps.com/hmg-prod/images/190130-chicken-shwarma-horizontal-1549421250.png?crop=1xw:0.843328335832084xh;center,top"),
                        height: 200,
                        width: 200,
                      ),
                      Text(
                        "Chiken Shawarma",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
