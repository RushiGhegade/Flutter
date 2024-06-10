import 'package:bicycle/view/screen1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class imageCycle extends ChangeNotifier {
  List<Map<String, dynamic>> getdata() {
    return [
      {
        "image": "lib/images/p3.png",
        "road": "Road Bike",
        "name": "Kiross",
        "price": "\$1,599.99"
      },
      {
        "image": "lib/images/p2.png",
        "road": "GT Bike",
        "name": "GT Bike",
        "price": "\$1,599.99",
      },
      {
        "image": "lib/images/p4.png",
        "road": "Road bike",
        "name": "Kiross",
        "price": "\$1,599.99",
      },
      {
        "image": "lib/images/p5.png",
        "road": "Road bike",
        "name": "Kiross",
        "price": "\$1,599.99",
      },
    ];
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return imageCycle();
          },
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Screen1(),
      ),
    );
  }
}

/*
const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen1(),
    );
*/