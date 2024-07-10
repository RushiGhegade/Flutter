import 'package:flutter/material.dart';
import 'package:inheritedstate_demo/Assignment.dart';

void main() {
  runApp(MyApp(child: Assignment()));
}

class MyApp extends InheritedWidget {
  String? id;
  String? name;
  String? username;

  MyApp({this.id, this.name, this.username, required super.child});

  static MyApp of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyApp>()!;
  }

  @override
  bool updateShouldNotify(MyApp oldwidget) {
    if (id != oldwidget.id ||
        name != oldwidget.name ||
        username != oldwidget.username) {
      return true;
    } else {
      return false;
    }
  }
}
