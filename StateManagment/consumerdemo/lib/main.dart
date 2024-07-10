import 'dart:developer';
import 'dart:js';

import 'package:consumerdemo/MyPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    log("in MyApp build");
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return Employee(empName: "Rushi", empId: 1);
        }),
        ChangeNotifierProvider(create: (context) {
          return Company(proName: "Mobail dev", salary: 30000);
        })
      ],
      child: const MaterialApp(
        home: MyPage(),
      ),
    );
  }
}

class Employee extends ChangeNotifier {
  String empName;
  int empId;
  Employee({required this.empId, required this.empName});

  void changedata1(String empName, int empId) {
    log("$context");
    this.empName = empName;
    this.empId = empId;
    notifyListeners();
  }
}

class Company extends ChangeNotifier {
  String proName;
  double salary;

  Company({required this.proName, required this.salary});

  void changedata(String proName, double salary) {
    log("$context");
    this.proName = proName;
    this.salary = salary;
    notifyListeners();
  }
}
