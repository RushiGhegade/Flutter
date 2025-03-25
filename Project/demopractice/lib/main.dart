import 'package:demopractice/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        return ChangeValue(value: 0);
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

class ChangeValue extends ChangeNotifier {
  int? value;

  ChangeValue({required this.value});

  void changeValue(int value) {
    this.value = value;
    notifyListeners();
  }
}

class ValueChnageGetX extends GetxController {
  Rx<int> value = 0.obs;

  // ValueChnageGetX({required this.value});\

  // String str = new String().

  void changeValue(int value) {
    this.value.value = value;
  }
}
