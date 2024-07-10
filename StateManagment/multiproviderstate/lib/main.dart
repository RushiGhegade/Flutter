import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:multiproviderstate/NewScreen.dart';
import 'package:provider/provider.dart';

void main() {
  log("in main App");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    log("In build MyApp");
    return MultiProvider(
      providers: [
        Provider(
          create: (context) {
            return const Employee(empName: "Rushi", empId: 1);
          },
        ),
        ChangeNotifierProvider(create: (context) {
          return Devloper(projectName: "Mobile Dev", salary: 200);
        })
      ],
      child: MaterialApp(
        home: NewScreen(),
      ),
    );
  }
}

class Employee {
  final String empName;
  final int empId;

  const Employee({required this.empName, required this.empId});
}

class Devloper extends ChangeNotifier {
  String projectName;
  int salary;

  Devloper({required this.projectName, required this.salary});

  void changeData({required String projectName, required int salary}) {
    this.projectName = projectName;
    this.salary = salary;
    notifyListeners();
  }
}
