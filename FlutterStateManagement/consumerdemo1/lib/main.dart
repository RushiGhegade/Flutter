import 'package:consumerdemo1/MyInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return Mall(mallName: "Finix", mallLoc: "Pune");
        }),
        ChangeNotifierProvider(create: (context) {
          return Shopping(price: 70000.00, product: "Laptop");
        })
      ],
      child: const MaterialApp(home: MyInfo()),
    );
  }
}

class Mall extends ChangeNotifier {
  String mallName;
  String mallLoc;

  Mall({required this.mallName, required this.mallLoc});

  void changeMallInfo(String mallName, String mallLoc) {
    this.mallName = mallName;
    this.mallLoc = mallLoc;
    notifyListeners();
  }
}

class Shopping extends ChangeNotifier {
  double price;
  String product;

  Shopping({required this.price, required this.product});

  void changedata({required double price, required String product}) {
    this.price = price;
    this.product = product;
    notifyListeners();
  }
}
