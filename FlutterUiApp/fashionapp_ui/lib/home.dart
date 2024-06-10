import 'package:fashionapp_ui/Cart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> list = [
    {
      "image": "lib/Images/s2.png",
      "Price": "\$240.32",
      "name": "Tagerine Shirt"
    },
    {
      "image": "lib/Images/s2_1.png",
      "Price": "\$325.36",
      "name": "Leather Coart"
    },
    {
      "image": "lib/Images/s2_2.png",
      "Price": "\$125.36",
      "name": "Tagerine Shirt"
    },
    {
      "image": "lib/Images/s2_3.png",
      "Price": "\$825.36",
      "name": "Leather Coart",
    }
  ];

  List<String> map = ["All", "Men", "Women", "Kids", "Othor"];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Image(image: AssetImage("lib/Images/Menu.png")),
                  Spacer(),
                  Image(image: AssetImage("lib/Images/Profile.png")),
                  // SizedBox(width: s,),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Explore",
                style: GoogleFonts.imprima(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Best trendy collection!",
                style: GoogleFonts.imprima(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    // width: ,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: map.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 30,
                          width: 70,
                          margin: const EdgeInsets.only(right: 6),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: (index == 0)
                                ? const Color.fromRGBO(255, 122, 0, 1)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            map[index],
                            style: GoogleFonts.imprima(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(13, 13, 14, 1)),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 7,
                  crossAxisSpacing: 7,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.4),
                  // childAspectRatio: MediaQuery.of(context).size.width /
                  //     (MediaQuery.of(context).size.height / 1),
                ),
                itemBuilder: (context, index) {
                  return Container(
                    height: 120,
                    // color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const Details();
                            }));
                          },
                          child: Container(
                            height: 210,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(list[index]['image']),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Text(
                          list[index]['Price'],
                          style: GoogleFonts.imprima(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(13, 13, 14, 1)),
                        ),
                        Text(
                          list[index]['name'],
                          style: GoogleFonts.imprima(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(13, 13, 14, 1)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        selectedItemColor: const Color.fromRGBO(255, 122, 0, 1),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Cart();
                }));
              },
              child: const Icon(Icons.badge_outlined),
            ),
            label: "cart",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
