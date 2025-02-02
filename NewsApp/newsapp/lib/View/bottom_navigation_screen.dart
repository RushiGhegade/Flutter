import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:newsapp/View/homescreen.dart';
import 'package:newsapp/View/save_screen.dart';
import 'package:newsapp/View/search_screen.dart';

int select = 0;

class MyBottomNavigation {
  static Widget myBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: select,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedFontSize: 17,
        selectedIconTheme: IconThemeData(size: 30),
        onTap: (index) {
          select = index;
          log("$select");
          if (index == 0) {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return HomeScreen();
              },
            ));
          } else if (index == 1) {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return SearchScreen();
              },
            ));
          } else {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return SaveScreen();
              },
            ));
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.save), label: "Save")
        ]);
  }

  static PreferredSizeWidget? myAppBar() {
    return AppBar(
      leading: Icon(Icons.menu),
      actions: [
        Icon(Icons.notification_important_rounded),
        SizedBox(
          width: 10,
        ),
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1.0),
        )),
      ),
      // backgroundColor: Colors.blue,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 21,
        fontWeight: FontWeight.bold,
      ),
      title: Text("World News"),
    );
  }
}
