





import 'package:flutter/material.dart';
import 'package:inheriateddemo/myDemo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PlayerInfo(
        name: "Virat Kohli",
        city: "Delhi",
        team: "RCB",
        child: const MaterialApp(
          home: ShowInfoScreen(),
        ));
  }
}

class PlayerInfo extends InheritedWidget {
  String? name;
  String? city;
  String? team;

  PlayerInfo(
      {super.key, this.name, this.city, this.team, required super.child});

  static PlayerInfo of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType()!;
  }

  @override
  bool updateShouldNotify(PlayerInfo oldWidget) {
    return name != oldWidget.name ||
        city != oldWidget.city ||
        team != oldWidget.team;
  }
}
