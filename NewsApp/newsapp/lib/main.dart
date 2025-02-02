import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'View/splash_screen.dart';
import 'model/newsProviderclass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return News(newsData: {}, saveData: []);
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
