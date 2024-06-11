import 'package:flutter/material.dart';
import 'package:musicapp/view/Screen1.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class Playlist extends ChangeNotifier {
  // int index;

  // Playlist(this.index);

  // int takeindex()

  List<Map<String, dynamic>> getdata() {
    return [
      {"image": "lib/Images/s2_1.jpg", "Name": "Dead inside", "Year": "2020"},
      {"image": "lib/Images/s2_2.jpg", "Name": "Alone ", "Year": "2023"},
      {"image": "lib/Images/s2_3.jpg", "Name": "Heartless ", "Year": "2023"},
      {"image": "lib/Images/s2_1.jpg", "Name": "Dead inside", "Year": "2020"},
      {"image": "lib/Images/s2_2.jpg", "Name": "Alone ", "Year": "2023"},
      {"image": "lib/Images/s2_3.jpg", "Name": "Heartless ", "Year": "2023"},
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
            return Playlist();
          },
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Screen1(),
      ),
    );
  }
}
