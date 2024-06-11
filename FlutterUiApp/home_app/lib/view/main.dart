import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui';
import 'screen1.dart';

void main() {
  // print("");
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class HomeInfo extends ChangeNotifier {
  List<Map<String, dynamic>> homeInfo() {
    return [
      {
        "image": "lib/images/s2_1.jpg",
        "name": "Night Hill Villa",
        "location": "London,Night Hill",
        "price": "5900 /Month",
        "quantitybed": "5",
        "quantitybath": "6",
        "square": "7,000 sq ft"
      },
      {
        "image": "lib/images/s2_2.jpg",
        "name": "Night Villa",
        "location": "London,New Park",
        "price": "4900 /Month",
        "quantitybed": "3",
        "quantitybath": "4",
        "square": "6,000 sq ft"
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
        ChangeNotifierProvider(create: (context) {
          return HomeInfo();
        })
      ],
      child:
          const MaterialApp(debugShowCheckedModeBanner: false, home: Screen1()),
    );
  }
}
