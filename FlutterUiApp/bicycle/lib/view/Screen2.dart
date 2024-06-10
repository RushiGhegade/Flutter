import 'package:bicycle/view/Screen3.dart';
import 'package:bicycle/view/main.dart';
import 'package:bicycle/view/screen1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

int indexs = 0;

/*
lib/images/image 1.png
    - lib/images/image 2.png
    - lib/images/image 3.png
    - lib/images/image 4.png
    - lib/images/pngwing (1).png
    - lib/images/pngwing (2).png
    - lib/images/pngwing (2).png
    - lib/images/pngwing (3).png
    - lib/images/pngwing (4).png
*/
class _Screen2State extends State<Screen2> {
  // List<Map<String, dynamic>> cycle = [
  //   {
  //     "image": "lib/images/pngwing (1).png",
  //     "road": "Road Bike",
  //     "name": "Kiross",
  //     "price": "\$1,599.99"
  //   },
  //   {
  //     "image": "lib/images/pngwing (2).png",
  //     "road": "GT Bike",
  //     "name": "GT Bike",
  //     "price": "\$1,599.99",
  //   },
  //   {
  //     "image": "lib/images/pngwing (3).png",
  //     "road": "Road bike",
  //     "name": "Kiross",
  //     "price": "\$1,599.99",
  //   },
  //   {
  //     "image": "lib/images/pngwing (4).png",
  //     "road": "Road bike",
  //     "name": "Kiross",
  //     "price": "\$1,599.99",
  //   },
  // ];

  List<String> part = [
    "lib/images/image 2.png",
    "lib/images/image 1.png",
    "lib/images/image 3.png",
    "lib/images/image 4.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(53, 63, 84, 0.6),
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20),
                child: Row(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 200,
                      child: Text(
                        "Choose Your Bicycle",
                        style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(55, 182, 233, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 313),
                child: Image(
                  image: AssetImage("lib/images/Rectangle 1.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 130, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 220,
                      width: 400,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.5),
                                offset: Offset(5, 5))
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(53, 63, 84, 0.6)),
                      child: Row(
                        children: [
                          const Image(
                              image: AssetImage("lib/images/pngwing.png")),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Icon(Icons.cycle),
                              Text(
                                "EXTREME",
                                style: GoogleFonts.allertaStencil(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1)),
                              ),
                              const Spacer(),
                              Text(
                                "30% OFF",
                                style: GoogleFonts.poppins(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: 300,
                      child: Row(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: part.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(right: 15),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: (index == 0)
                                        ? const Color.fromRGBO(55, 182, 233, 1)
                                        : Colors.white),
                                child: Image(image: AssetImage(part[index])),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 440,
                      width: double.infinity,
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 4,
                                childAspectRatio: 0.8),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              indexs = index;
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const Screen3();
                                },
                              ));
                            },
                            child: Container(
                              padding: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(53, 63, 84, 0.6),
                                  borderRadius: BorderRadius.circular(12)),
                              height: 100,
                              width: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Image(
                                    image: AssetImage(
                                      // cycle[index]['image'],
                                      Provider.of<imageCycle>(context)
                                          .getdata()[index]['image'],
                                    ),
                                    height: 160,
                                  ),
                                  Text(
                                    // cycle[index]['road'],
                                    Provider.of<imageCycle>(context)
                                        .getdata()[index]['road'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1)),
                                  ),
                                  Text(
                                    Provider.of<imageCycle>(context)
                                        .getdata()[index]['name'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1)),
                                  ),
                                  Text(
                                    Provider.of<imageCycle>(context)
                                        .getdata()[index]['price'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1)),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 807.400),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(36, 44, 59, 1),
                  ),
                  child: Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const Screen1();
                            },
                          ));
                        },
                        child: const Icon(
                          Icons.home,
                          size: 35,
                          color: Color.fromARGB(255, 172, 166, 166),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.shopping_bag_outlined,
                        size: 35,
                        color: Color.fromARGB(255, 172, 166, 166),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.photo_camera_back_outlined,
                        size: 35,
                        color: Color.fromARGB(255, 172, 166, 166),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.person_3_outlined,
                        size: 35,
                        color: Color.fromARGB(255, 172, 166, 166),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
