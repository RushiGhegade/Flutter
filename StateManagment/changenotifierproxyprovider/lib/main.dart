// changeNotifierProxyProvider
import 'dart:developer';

import 'package:changenotifierproxyprovider/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class Login extends ChangeNotifier {
  String userName;
  String password;

  Login({required this.userName, required this.password});

  void changePassword(String password) {
    this.password = password;
    notifyListeners();
  }
}

class Employee extends ChangeNotifier {
  int empId;
  String empName;
  String userName;
  String password;

  Employee(
      {required this.empId,
      required this.empName,
      required this.userName,
      required this.password});

// we also change password using this technique

  // void changePassword(String password) {
  //   this.password = password;
  //   notifyListeners();
  // }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            log("in create method changenoti");
            return Login(userName: "Rushi@123", password: "Rushi#1234");
          },
        ),
        ChangeNotifierProxyProvider<Login, Employee>(
          // when we can use a changeNotifier provider then we must need both class parent is changeNotifier
          create: (context) {
            log("in Craete method proxy");
            return Employee(
              empId: 1,
              empName: "Rushikesh",
              userName: Provider.of<Login>(context, listen: false).userName,
              password: Provider.of<Login>(context, listen: false).password,
            );
          },
          update: (context, login, employee) {
            log("in update method proxy");
            return Employee(
              empId: 1,
              empName: "Rushikesh",
              userName: login.userName,
              password: Provider.of<Login>(context).password,
            );
          },
        ),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
