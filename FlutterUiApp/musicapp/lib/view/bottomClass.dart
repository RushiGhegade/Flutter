import 'package:flutter/material.dart';
import 'package:musicapp/view/Screen1.dart';
import 'package:musicapp/view/Screen2.dart';
import 'package:musicapp/view/Screen3.dart';

class BottomClass extends StatefulWidget {
  const BottomClass({super.key});

  @override
  State<BottomClass> createState() => _BottomClassState();
}

int index = 2;

class _BottomClassState extends State<BottomClass> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
      selectedItemColor: const Color.fromRGBO(230, 154, 21, 1),
      unselectedItemColor: const Color.fromRGBO(157, 178, 206, 1),
      items: [
        BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                index = 0;
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const Screen3();
                  },
                ));
              },
              child: const Icon(
                Icons.favorite_border_outlined,
              ),
            ),
            label: "Favorite"),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
          ),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              index = 2;
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const Screen1();
                },
              ));
            },
            child: const Icon(
              Icons.home_outlined,
            ),
          ),
          label: "Home",
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_bag_sharp,
          ),
          label: "cart",
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              index = 4;
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const Screen2();
                },
              ));
            },
            child: const Icon(
              Icons.person_2,
            ),
          ),
          label: "Profile",
        )
      ],
    );
  }
}
