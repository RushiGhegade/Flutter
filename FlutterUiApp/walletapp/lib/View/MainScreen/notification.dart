import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletapp/View/MainScreen/bottom_navigation_bar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> info = [
    {
      "Today": [
        {
          "Image": "lib/Assets/Images/s2_5.png",
          "Name": "Walmart",
          "Date": "Today 12:32",
          "Price": "-\$35.23 >",
          "Dis": "Retailer Corporation",
          "day": "December 29,2022 - 12:32",
          "id": "2312348463543",
        },
        {
          "Image": "lib/Assets/Images/Topup.png",
          "Name": "Top up",
          "Date": "Yesterday 02:12",
          "Price": "+\$430.00 >",
          "Dis": "Retailer Corporation",
          "day": "December 29,2022 - 12:32",
          "id": "2312348463543",
        },
        {
          "Image": "lib/Assets/Images/s2_6.png",
          "Name": "Netflix",
          "Date": "Dec 24 13:53",
          "Price": "-\$13.00 >",
          "Dis": "Retailer Corporation",
          "day": "December 29,2022 - 12:32",
          "id": "2312348463543",
        }
      ],
      "Yesterday": [
        {
          "Image": "lib/Assets/Images/s2_7.png",
          "Name": "Amazon",
          "Date": "Today 12:32",
          "Price": "-\$35.23 >",
          "Dis": "Retailer Corporation",
          "day": "December 29,2022 - 12:32",
          "id": "2312348463543",
        },
        {
          "Image": "lib/Assets/Images/s2_8.png",
          "Name": "Nike",
          "Date": "Yesterday 02:12",
          "Price": "+\$430.00 >",
          "Dis": "Retailer Corporation",
          "day": "December 29,2022 - 12:32",
          "id": "2312348463543",
        },
        {
          "Image": "lib/Assets/Images/s2_9.png",
          "Name": "The Home Depot",
          "Date": "Dec 24 13:53",
          "Price": "-\$13.00 >",
          "Dis": "Retailer Corporation",
          "day": "December 29,2022 - 12:32",
          "id": "2312348463543",
        }
      ],
      "Thursday": [
        {
          "Image": "lib/Assets/Images/s2_7.png",
          "Name": "Amezon",
          "Date": "Today 12:32",
          "Price": "-\$35.23 >",
          "Dis": "Retailer Corporation",
          "day": "December 29,2022 - 12:32",
          "id": "2312348463543",
        },
        {
          "Image": "lib/Assets/Images/s2_5.png",
          "Name": "Welmart",
          "Date": "Yesterday 02:12",
          "Price": "+\$430.00 >",
          "Dis": "Retailer Corporation",
          "day": "December 29,2022 - 12:32",
          "id": "2312348463543",
        },
        {
          "Image": "lib/Assets/Images/s2_6.png",
          "Name": "Netflix",
          "Date": "Dec 24 13:53",
          "Price": "-\$13.00 >",
          "Dis": "Retailer Corporation",
          "day": "December 29,2022 - 12:32",
          "id": "2312348463543",
        }
      ],
    }
  ];

  List<String> day = [
    "Today",
    "Yesterday",
    "Thursday",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 15, left: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "History",
                style: GoogleFonts.sora(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(25, 25, 25, 1),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 38,
                    width: 250,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        // border,
                        isDense: true,
                        prefixIcon: Icon(Icons.search),
                        hintText: "Value goes here",
                        hintStyle: TextStyle(
                            height: 3.4,
                            color: Color.fromRGBO(110, 111, 112, 1)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(183, 186, 197, 1),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(183, 186, 197, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox()
                  const Spacer(),
                  Container(
                    height: 38,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(183, 186, 197, 1),
                      ),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 3,
                        ),
                        const Icon(
                          Icons.format_align_justify,
                          color: Color.fromARGB(210, 25, 25, 25),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Filter",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(210, 25, 25, 25),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              // const SizedBox(
              //   height: 7,
              // ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 700,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      String str = "${info[0]["Today"][index]["Image"]}";
                      log(str);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            day[index],
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(83, 93, 102, 1),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (context, index1) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      log("Good Job");
                                      ShowBottombar(index, index1);
                                      setState(() {});
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 15, top: 10),
                                          height: 38,
                                          width: 38,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(info[0]
                                                          [day[index]][index1]
                                                      ["Image"]))),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              info[0][day[index]][index1]
                                                  ["Name"],
                                              style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromRGBO(
                                                    25, 25, 25, 1),
                                              ),
                                            ),
                                            Text(
                                              info[0][day[index]][index1]
                                                  ["Date"],
                                              style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: const Color.fromRGBO(
                                                    120, 131, 141, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Text(
                                          info[0][day[index]][index1]["Price"],
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: (index1 == 1 && index == 0)
                                                ? const Color.fromRGBO(
                                                    40, 155, 79, 1)
                                                : const Color.fromRGBO(
                                                    185, 39, 39, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        height: 8,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(187, 194, 222, 0.253)),
                      );
                    },
                    itemCount: info[0].length),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }

  void ShowBottombar(int index, int index1) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 15, top: 10),
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                info[0][day[index]][index1]["Image"]))),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        info[0][day[index]][index1]["Name"],
                        style: GoogleFonts.poppins(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(25, 25, 25, 1),
                        ),
                      ),
                      Text(
                        info[0][day[index]][index1]["Dis"],
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(120, 131, 141, 1),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      // info[0][day[index]][index1]["Price"],
                      "Done",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(29, 98, 202, 1),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(72, 209, 166, 166)),
                child: Text(
                  info[0][day[index]][index1]["Price"],
                  style: const TextStyle(color: Colors.red, fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: const Color.fromARGB(255, 167, 157, 156)),
                  // color: const Color.fromARGB(72, 209, 166, 166)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        day[index],
                        style: const TextStyle(
                            color: Color.fromRGBO(145, 162, 178, 1),
                            fontSize: 15),
                      ),
                      Text(
                        info[0][day[index]][index1]["day"],
                        style: const TextStyle(
                            color: Color.fromRGBO(33, 34, 36, 0.889),
                            fontSize: 15,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: const Color.fromARGB(255, 167, 157, 156)),
                  // color: const Color.fromARGB(72, 209, 166, 166)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Transaction no.",
                        style: TextStyle(
                            color: Color.fromRGBO(120, 131, 141, 1),
                            fontSize: 15),
                      ),
                      Text(
                        info[0][day[index]][index1]["id"],
                        style: const TextStyle(
                            color: Color.fromRGBO(33, 34, 36, 0.889),
                            fontSize: 15,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: const Color.fromARGB(255, 167, 157, 156)),
                  // color: const Color.fromARGB(72, 209, 166, 166)
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.flag,
                      color: Colors.red,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Report a problem",
                      style: TextStyle(
                          color: Color.fromRGBO(216, 8, 8, 1),
                          fontSize: 19,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
