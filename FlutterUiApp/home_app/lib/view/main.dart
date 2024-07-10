import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';

import 'screen1.dart';

void main() {
  // print("");
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class HomeInfo extends ChangeNotifier {
  List<Map<String, dynamic>> NearByLoc = [
    {
      "image": "lib/images/s2_3.jpg",
      "name": "Jumeriah Golf Estates Villa",
      "location": "London,Area Plam Jumeriah",
      "bed": "4 Bedrooms",
      "bath": "5 Bathrooms",
      "price": "4500 /Month"
    },
    {
      "image": "lib/images/h4.jpg",
      "name": "Sunstone Villa",
      "location": "India,white lotus villa",
      "bed": "4 Bedrooms",
      "bath": "5 Bathrooms",
      "price": "2500 /Month"
    },
    {
      "image": "lib/images/h3.jpg",
      "name": "Cloudhaven Villa",
      "location": "india,Night villa",
      "bed": "4 Bedrooms",
      "bath": "5 Bathrooms",
      "price": "3500 /Month",
    },
    {
      "image": "lib/images/s2_3.jpg",
      "name": "Breezeway House",
      "location": "London,Area Plam Jumeriah",
      "bed": "4 Bedrooms",
      "bath": "5 Bathrooms",
      "price": "9500 /Month"
    },
  ];

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
        "image": "lib/images/h2.jpg",
        "name": "WeatherNest",
        "location": "London,Night Hill",
        "price": "7900 /Month",
        "quantitybed": "5",
        "quantitybath": "6",
        "square": "7,000 sq ft"
      },
      {
        "image": "lib/images/h1.jpg",
        "name": "Skyline Villa",
        "location": "London,Night Hill",
        "price": "18000 /Month",
        "quantitybed": "5",
        "quantitybath": "6",
        "square": "7,000 sq ft"
      },
      {
        "image": "lib/images/s2_2.jpg",
        "name": "Night Villa",
        "location": "London,New Park",
        "price": "1900 /Month",
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
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Screen1(),
      ),
    );
  }
}
