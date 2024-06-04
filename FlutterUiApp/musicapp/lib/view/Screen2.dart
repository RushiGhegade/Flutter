import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/view/Screen3.dart';
import 'package:musicapp/view/bottomClass.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen1State();
}

class _Screen1State extends State<Screen2> {
  List<Map<String, dynamic>> playlist = [
    {"image": "lib/Images/s2_1.jpg", "Name": "Dead inside", "Year": "2020"},
    {"image": "lib/Images/s2_2.jpg", "Name": "Alone ", "Year": "2023"},
    {"image": "lib/Images/s2_3.jpg", "Name": "Heartless ", "Year": "2023"},
    {"image": "lib/Images/s2_1.jpg", "Name": "Dead inside", "Year": "2020"},
    {"image": "lib/Images/s2_2.jpg", "Name": "Alone ", "Year": "2023"},
    {"image": "lib/Images/s2_3.jpg", "Name": "Heartless ", "Year": "2023"},
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              width: 459,
              height: 367,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("lib/Images/s2.jpg"),
                      fit: BoxFit.cover)),
              child: Center(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(
                          flex: 3,
                        ),
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
                        const Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              )),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 7,
                      width: 21,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          shape: BoxShape.rectangle,
                          color: Color.fromRGBO(255, 61, 0, 1)),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Container(
                      height: 7,
                      width: 7,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          shape: BoxShape.rectangle,
                          color: Color.fromRGBO(159, 159, 159, 1)),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Container(
                      height: 7,
                      width: 7,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          shape: BoxShape.rectangle,
                          color: Color.fromRGBO(159, 159, 159, 1)),
                    )
                  ],
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
                    itemCount: playlist.length,
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
                                            playlist[index]['image']),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                playlist[index]['Name'],
                                style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        const Color.fromRGBO(203, 200, 200, 1)),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                playlist[index]['Year'],
                                style: GoogleFonts.inter(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        const Color.fromRGBO(132, 125, 125, 1)),
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
      bottomNavigationBar: const BottomClass(),
    );
  }
}
