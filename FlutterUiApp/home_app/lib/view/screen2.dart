import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_app/view/screen3.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

List<Map<String, dynamic>> data = [
  {
    "image": "lib/images/s2_1.jpg",
    "name": "Night Hill Villa",
    "location": "London,Night Hill",
    "price": "5900 /Month",
    "quantitybed": "5",
    "quantitybath": "6",
    "square": "7,000 sq ft"
  },
  {
    "image": "lib/images/s2_2.jpg",
    "name": "Night Villa",
    "location": "London,New Park",
    "price": "4900 /Month",
    "quantitybed": "3",
    "quantitybath": "4",
    "square": "6,000 sq ft"
  },
];
List<Map<String, dynamic>> infoRoom = [
  {
    "image": "lib\images\s2_3.jpg",
    "name": "Jumeriah Golf Estates Villa",
    "location": "London,Area Plam Jumeriah",
    "bed": "4 Bedrooms",
    "bath": "5 Bathrooms",
    "price": "4500 /Month"
  },
  {
    "image": "lib\images\s2_3.jpg",
    "name": "Jumeriah Golf Estates Villa",
    "location": "London,Area Plam Jumeriah",
    "bed": "4 Bedrooms",
    "bath": "5 Bathrooms",
    "price": "4500 /Month"
  },
];

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.9),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    "Hey Dravid,",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(101, 101, 101, 1),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 48,
                    width: 48,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("lib/images/s2_a.png"))),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: Text(
                  "Let’s find your best residence ",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                height: 46,
                width: 390,
                // decoration: const BoxDecoration(boxShadow: [
                // //   BoxShadow(
                // //       color: Color.fromRGBO(101, 101, 101, 1), blurRadius: 5),
                // // ]),
                child: TextFormField(
                  // enabled: true,

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    label: Text(
                      "Search your favourite paradise",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(33, 33, 33, 1),
                      ),
                    ),
                    prefixIcon: const Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Text(
                    "Most popular",
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(33, 33, 33, 1),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "See All",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(32, 169, 247, 1),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 350,
                    width: 400,
                    // height: ,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            log("$index");

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const Screen3();
                                },
                              ),
                            );
                          },
                          child: Container(
                            // height: 250,
                            width: 250,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(right: 20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              // border: Border.all(),
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // alignment: Alignment.center,
                                  height: 230,
                                  width: 230,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(
                                            data[index]['image'],
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  data[index]['name'],
                                  style: GoogleFonts.poppins(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  data[index]['name'],
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(72, 72, 72, 1),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "\$${data[index]['price'].substring(0, 5)}",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(
                                            32, 169, 247, 1),
                                      ),
                                    ),
                                    Text(
                                      "${data[index]['price'].substring(5, 11)}",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            const Color.fromRGBO(72, 72, 72, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Nearby your location",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(33, 33, 33, 1),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "More",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(32, 169, 247, 1),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: infoRoom.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20, right: 8),
                    height: 108,
                    width: 346,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage("lib/images/s2_3.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              infoRoom[index]['name'],
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 16,
                                  color: Color.fromRGBO(90, 90, 90, 1),
                                ),
                                Text(
                                  infoRoom[index]['location'],
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(90, 90, 90, 1),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.bed,
                                  size: 15,
                                  color: Color.fromRGBO(90, 90, 90, 1),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  infoRoom[index]['bed'],
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(90, 90, 90, 1),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  Icons.bathtub_sharp,
                                  size: 15,
                                  color: Color.fromRGBO(90, 90, 90, 1),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  infoRoom[index]['bath'],
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(90, 90, 90, 1),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 280,
                              height: 20,
                              child: Row(
                                children: [
                                  const Spacer(),
                                  // SizedBox(width: 300,),
                                  Text(
                                    "\$${infoRoom[index]['price'].substring(0, 4)}",
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromRGBO(32, 169, 247, 1),
                                    ),
                                  ),
                                  Text(
                                    "${infoRoom[index]['price'].substring(4, 11)}",
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromRGBO(90, 90, 90, 1),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}