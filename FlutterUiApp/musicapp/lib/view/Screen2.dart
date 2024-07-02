import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/view/Screen3.dart';
import 'package:musicapp/view/Screen4.dart';
import 'package:musicapp/view/bottomClass.dart';
import 'package:musicapp/view/main.dart';
import 'package:provider/provider.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen1State();
}

int indexs = 0;

class _Screen1State extends State<Screen2> {
  // List<Map<String, dynamic>> playlist = [
  //   {"image": "lib/Images/s2_1.jpg", "Name": "Dead inside", "Year": "2020"},
  //   {"image": "lib/Images/s2_2.jpg", "Name": "Alone ", "Year": "2023"},
  //   {"image": "lib/Images/s2_3.jpg", "Name": "Heartless ", "Year": "2023"},
  //   {"image": "lib/Images/s2_1.jpg", "Name": "Dead inside", "Year": "2020"},
  //   {"image": "lib/Images/s2_2.jpg", "Name": "Alone ", "Year": "2023"},
  //   {"image": "lib/Images/s2_3.jpg", "Name": "Heartless ", "Year": "2023"},
  // ];

  List<Map<String, dynamic>> playlist1 = [
    {
      "image": "lib/Images/s2_4.jpg",
      "Name": "We Are Chaos",
      "Year": "2020 * Easy Living"
    },
    {
      "image": "lib/Images/s2_5.jpg",
      "Name": "Alone ",
      "Year": "2023 * Berrechid"
    },
    {
      "image": "lib/Images/s2_4.jpg",
      "Name": "We Are Chaos",
      "Year": "2020 * Easy Living"
    },
    {
      "image": "lib/Images/s2_5.jpg",
      "Name": "Alone ",
      "Year": "2023 * Berrechid"
    },
    // {"image": "lib/Images/s2_3.jpg", "Name": "Heartless ", "Year": "2023"},
  ];

  List<String> images = [
    // "lib/Images/k5.jpg",
    "lib/Images/s2.jpg",
    "lib/Images/pk5.png",
    "lib/Images/pl1.png"
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              // fit: StackFit.loose,
              // clipBehavior: Clip.antiAlias,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: CarouselSlider(
                    items: images
                        .map((image) => Container(
                              width: 459,
                              height: 407,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(image),
                                fit: BoxFit.cover,
                              )),
                            ))
                        .toList(),
                    options: CarouselOptions(
                      onPageChanged: (index1, reason) {
                        index = index1;
                        // log("$index");
                        setState(() {});
                      },
                      viewportFraction: 1,
                      height: 407,
                      enlargeFactor: 0.3,
                      autoPlay: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 260, left: 20),
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          "A.L.O.N.E",
                          style: GoogleFonts.inter(
                              fontSize: 36,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(255, 255, 255, 1)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 37,
                          width: 127,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(19),
                            color: const Color.fromRGBO(255, 46, 0, 1),
                          ),
                          child: Text(
                            "Subscribe",
                            style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(19, 19, 19, 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 442.4,
              width: 586,
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(24, 24, 24, 1)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: images.length,
                          itemBuilder: (context, index1) {
                            return Container(
                              margin: const EdgeInsets.only(right: 4),
                              height: 10,
                              width: (index == index1) ? 17 : 10,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  shape: BoxShape.rectangle,
                                  color: (index == index1)
                                      ? const Color.fromRGBO(255, 61, 0, 1)
                                      : const Color.fromRGBO(159, 159, 159, 1)),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Discography",
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(255, 46, 0, 1)),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const Screen4();
                            },
                          ));
                        },
                        child: Text(
                          "See all",
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(248, 162, 69, 1)),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 190,
                    width: double.infinity,
                    child: ListView.builder(
                      // margin: EdgeInsets.all(10),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: Provider.of<Playlist>(context).getdata.length,
                      itemBuilder: (context, index) {
                        return Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    indexs = index;
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const Screen3();
                                    }));
                                  },
                                  child: Container(
                                    // margin: const EdgeInsets.all(10),
                                    height: 140,
                                    width: 119,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(
                                            Provider.of<Playlist>(context)
                                                .getdata[index]['image'],
                                          ),
                                          // playlist[index]['image']),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  // playlist[index]['Name'],
                                  Provider.of<Playlist>(context).getdata[index]
                                      ['Name'],
                                  style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: const Color.fromRGBO(
                                          203, 200, 200, 1)),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  // playlist[index]['Year'],
                                  Provider.of<Playlist>(context).getdata[index]
                                      ['Year'],
                                  style: GoogleFonts.inter(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(
                                          132, 125, 125, 1)),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  //--------------------
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Popular singles",
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(203, 200, 200, 1)),
                      ),
                      const Spacer(),
                      Text(
                        "See all",
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(248, 162, 69, 1)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    // margin: const EdgeInsets.all(1),
                    height: 135,
                    width: double.infinity,
                    child: ListView.builder(
                      // padding: EdgeInsets.all(10),
                      itemCount: playlist1.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 72,
                                  width: 67,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image:
                                          AssetImage(playlist1[index]['image']),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      playlist1[index]['Name'],
                                      style: GoogleFonts.inter(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromRGBO(
                                              203, 200, 200, 1)),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      playlist1[index]['Year'],
                                      style: GoogleFonts.inter(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              132, 125, 125, 1)),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.more_vert,
                                  size: 40,
                                  color: Color.fromRGBO(217, 217, 217, 1),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomClass(),
    );
  }
}
