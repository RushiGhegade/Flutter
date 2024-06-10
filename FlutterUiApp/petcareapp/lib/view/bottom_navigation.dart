import 'package:flutter/material.dart';
import 'package:petcareapp/view/Veterinary.dart';
import 'package:petcareapp/view/dashboard.dart';

class BottomNavigations extends StatefulWidget {
  const BottomNavigations({super.key});

  @override
  State createState() => _BottomNavigationsState();
}
int index = 0;

class _BottomNavigationsState extends State {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromRGBO(245, 146, 69, 1),
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: GestureDetector(
                onTap: () {
                  index = 0;
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Dashboard();
                  }));
                },
                child: const Icon(Icons.home_outlined)),
          ),
          BottomNavigationBarItem(
              label: "Service",
              icon: GestureDetector(
                onTap: () {
                  index = 1;
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Veterinary();
                  }));
                },
                child: const Icon(
                  Icons.favorite_border,
                ),
              )),
          const BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 1,
              )),
          const BottomNavigationBarItem(
            label: "History",
            icon: Icon(Icons.history_sharp),
          ),
          const BottomNavigationBarItem(
              label: "profile", icon: Icon(Icons.person_3_outlined)),
        ]);
  }
}
