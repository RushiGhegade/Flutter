import 'package:flutter/material.dart';
import 'package:walletapp/View/MainScreen/cards.dart';
import 'package:walletapp/View/MainScreen/home_Screen.dart';
import 'package:walletapp/View/MainScreen/more.dart';
import 'package:walletapp/View/MainScreen/notification.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

int index = 0;

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromRGBO(111, 69, 233, 1),
        unselectedItemColor: const Color.fromRGBO(83, 93, 102, 1),
        selectedFontSize: 15,
        unselectedFontSize: 15,
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            // activeIcon: Icon(Icons.abc),
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const HomeScreen();
                    },
                  ));
                  index = 0;
                  setState(() {});
                },
                child: const Icon(Icons.home)),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const NotificationScreen();
                    },
                  ));
                  index = 1;
                  setState(() {});
                },
                child: const Icon(Icons.note_add_rounded)),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Cards();
                    },
                  ));
                  index = 2;
                  setState(() {});
                },
                child: const Icon(Icons.card_travel_rounded)),
            label: "Cards",
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const More();
                    },
                  ));
                  index = 3;
                  setState(() {});
                },
                child: const Icon(Icons.movie_rounded)),
            label: "More",
          ),
        ]);
  }
}
