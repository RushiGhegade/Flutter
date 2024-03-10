// Create a screen that displays an asset image of the food item at the top of the
// Screen, below the image, display the name of the food item and below the name
// give the description of the item. Add appropriate padding.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Food Info"),
          backgroundColor: Colors.amber,
        ),
        body: const Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: NetworkImage(
                    "https://hips.hearstapps.com/hmg-prod/images/classic-cheese-pizza-recipe-2-64429a0cb408b.jpg?crop=0.6666666666666667xw:1xh;center,top&resize=1200:*"),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "PIZZA",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                  "A slice of classic cheese pizza is one of life's greatest pleasures. While calling for delivery is always a treat, being able to make your own pizza recipes at home is even more satisfying. This recipe covers the basics: kneading a simple dough, stretching it into a round, and cranking up your oven to get that perfect char. The tasty reward is a crispy-bottomed, airy crust topped with tangy tomato sauce, and milky mozzarella."),
            ],
          ),
        ),
      ),
    );
  }
}
