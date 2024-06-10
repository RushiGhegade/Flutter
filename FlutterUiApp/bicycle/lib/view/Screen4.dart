import 'package:bicycle/view/Screen2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

/*
lib/images/m1.png
    - lib/images/m2.png
    - lib/images/m3.png
*/
class _Screen4State extends State<Screen4> {
  List<Map<String, dynamic>> info = [
    {"image": "lib/images/m3.png", "name": "GT Bike", "price": "\$2,599"},
    {"image": "lib/images/m1.png", "name": "Helmet", "price": "\$125.99"},
    {"image": "lib/images/m2.png", "name": "Bottle", "price": "\$115.99"},
  ];

  List<Map<String, dynamic>> bill = [
    {"name": "Subtotal", "price": "\$2,841.99"},
    {"name": "Delivery fee", "price": "\$0"},
    {"name": "Discount", "price": "\30%"},
    {"name": "Total", "price": "\$1,989.37"},
  ];
  int num = 0;
  int add() {
    return num + 1;
  }

  int sub() {
    return num - 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(53, 63, 84, 0.6),
      body: Column(
        children: [
          Stack(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 313),
                child: Image(
                  image: AssetImage("lib/images/Rectangle 1.png"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40, left: 300),
                child: Image(
                  image: AssetImage("lib/images/EXTREME.png"),
                  height: 800,
                  width: 100,
                  opacity: AlwaysStoppedAnimation(0.4),
                ),
              ),
              Container(
                  height: 865,
                  width: double.infinity,
                  //
                  color: Color.fromRGBO(4, 5, 19, 0.6)),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20),
                child: Row(
                  children: [
                    SizedBox(
                      height: 40,
                      width: 250,
                      child: Text(
                        "My Shopping Cart",
                        style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const Screen2();
                          },
                        ));
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(55, 182, 233, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: info.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  margin: const EdgeInsets.only(
                                      left: 30, bottom: 10),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        width: 4,
                                        color: const Color.fromRGBO(
                                            53, 63, 84, 0.6),
                                      )),
                                  child: Image(
                                    image: AssetImage(
                                      info[index]['image'],
                                    ),
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      info[index]['name'],
                                      style: GoogleFonts.poppins(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                          color: const Color.fromRGBO(
                                              255, 255, 255, 1)),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          info[index]['price'],
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromRGBO(
                                                  55, 182, 233, 1)),
                                        ),
                                        // Spacer()
                                        const SizedBox(
                                          width: 70,
                                        ),
                                        Container(
                                          height: 30,
                                          width: 90,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              color: Color.fromRGBO(
                                                  30, 30, 30, 0.8)),
                                          child: Row(
                                            children: [
                                              const Spacer(),
                                              GestureDetector(
                                                onTap: () {
                                                  num++;
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  height: 25,
                                                  width: 25,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color:
                                                          const Color.fromRGBO(
                                                              55, 182, 233, 1)),
                                                  child: const Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              Text(
                                                "${add()}",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w700,
                                                    color: const Color.fromRGBO(
                                                        255, 255, 255, 1)),
                                              ),
                                              const Spacer(),
                                              Container(
                                                height: 25,
                                                width: 25,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: const Color.fromRGBO(
                                                        30, 30, 30, 0.9)),
                                                child: const Icon(
                                                  Icons.remove,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const Spacer(),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 1,
                              width: double.infinity,
                              color: Color.fromRGBO(255, 255, 255, 0.3),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        );
                      },
                    ),
                    Center(
                      child: Text(
                        "Your Bag Qualifies for Free Shipping",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: const Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 380,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(36, 44, 59, 0.6)),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "6Affg5",
                            style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(142, 142, 142, 1)),
                          ),
                          const Spacer(),
                          Container(
                            height: 40,
                            width: 87,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromRGBO(55, 182, 233, 1)),
                            child: Text(
                              "Apply",
                              style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 1)),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 630, left: 20, right: 10),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: bill.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              bill[index]['name'],
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 1)),
                            ),
                            Spacer(),
                            Text(
                              bill[index]['price'],
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(55, 182, 233, 1)),
                            )
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
              Padding(
                padding: const EdgeInsets.only(top: 810, left: 20, right: 10)
                // padding: const EdgeInsets.all(8.0),
                ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(55, 182, 233, 1)),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Check Out",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(255, 255, 255, 1)),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
