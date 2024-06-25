import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class DoctorInfo extends ChangeNotifier {
  int index;

  DoctorInfo({required this.index});

  void indexC(int index) {
    this.index = index;
    notifyListeners();
  }

  List<Map<String, dynamic>> info() {
    return [
      {
        "Image": "lib/images/s4_5.jpg",
        "Name": "Dr. Anna Johanson",
        "degree": "Veterinary Behavioral",
        "star": "4.5",
        "distance": "1km",
        "Experiance": "10 Year",
        "price": "\$550",
        "Location": "1.5 km",
      },
      {
        "Image": "lib/images/s4_6.jpg",
        "Name": "Dr. Vernon Chwe",
        "degree": "Veterinary Surgery",
        "star": "4.9",
        "distance": "1.5km",
        "Experiance": "11 Year",
        "price": "\$850",
        "Location": "3.5 km",
      },
      {
        "Image": "lib/images/s4_5.jpg",
        "Name": "Dr. Anna Johanson",
        "degree": "Veterinary Behavioral",
        "star": "4.5",
        "distance": "1km",
        "Experiance": "11 Year",
        "price": "\$250",
        "Location": "2.5 km",
      },
      {
        "Image": "lib/images/s4_6.jpg",
        "Name": "Dr. Vernon Chwe",
        "degree": "Veterinary Surgery",
        "star": "4.9",
        "distance": "1.5km",
        "Experiance": "11 Year",
        "price": "\$250",
        "Location": "2.5 km",
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
          return DoctorInfo(index: 0);
        })
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
