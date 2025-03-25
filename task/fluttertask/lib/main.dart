import 'package:flutter/material.dart';
import 'package:fluttertask/View/splash_screen.dart';
import 'package:fluttertask/model/ModelClass.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return MyData(list: []);
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
class MyData extends ChangeNotifier {
  List<Modelclass> list;

  MyData({required this.list});

  void changeData(List<Modelclass> list) {
    this.list = list;
    notifyListeners();
  }
}
