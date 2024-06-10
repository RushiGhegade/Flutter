import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcareapp/view/Veterinary.dart';

class DetailDoctor extends StatefulWidget {
  const DetailDoctor({super.key});

  @override
  State<DetailDoctor> createState() => _DetailDoctorState();
}

class _DetailDoctorState extends State<DetailDoctor> {
  List<Map<String, dynamic>> DInfo = [
    {
      "name": "Experience",
      "info": "11 Year",
    },
    {
      "name": "price",
      "info": "\$250",
    },
    {
      "name": "Location",
      "info": "2.5 km",
    }
  ];

  List<String> aDay = [
    "Fri, 6",
    "sat, 7",
    "sun, 8",
    "mon, 9",
    "tue, 10",
  ];
  List<String> atime = [
    "9:00",
    "15:00",
    "19:00",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 146, 69, 1),
      body: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Veterinary();
                    },
                  ));
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(255, 255, 255, 1)),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Color.fromRGBO(245, 146, 69, 1),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                "Veterinary",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(255, 255, 255, 1)),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 180,
            width: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  image: AssetImage("lib/images/p1 (2).png"),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(
              height: 500,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr. Anna Jhonason",
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(0, 0, 0, 1)),
                    ),
                    Text(
                      "Veterinary Behavioral",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromARGB(255, 106, 106, 107)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(10),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: DInfo.length,
                        itemBuilder: (context, index) {
                          return Container(
                            // padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(right: 40),
                            // height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.2),
                                    blurRadius: 10)
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  DInfo[index]["name"],
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(0, 0, 0, 1)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  DInfo[index]["info"],
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromRGBO(
                                          245, 146, 69, 1)),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Text(
                      "About",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(0, 0, 0, 1)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: Text(
                        "Dr. Maria Naiis is a highly experienced veterinarian with 11 years of dedicated practice, showcasing a pro...",
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 88, 88, 89)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Available Days",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(0, 0, 0, 1)),
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        const Icon(
                          Icons.calendar_today_outlined,
                          size: 16,
                          color: Color.fromRGBO(245, 146, 69, 1),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "October, 2023",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(255, 88, 88, 89)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      child: ListView.builder(
                        // padding: const EdgeInsets.only(top: 10,),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: aDay.length,
                        itemBuilder: (context, index) {
                          return Container(
                            // padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(right: 10),
                            // height: 100,
                            width: 70,
                            decoration: BoxDecoration(
                              color: (index == 2 || index == 4)
                                  ? const Color.fromRGBO(245, 146, 69, 1)
                                  : const Color.fromRGBO(255, 255, 255, 1),
                              border: Border.all(
                                  color: const Color.fromRGBO(245, 146, 69, 1)),
                              // color: const Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.circular(19),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  aDay[index],
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(0, 0, 0, 1)),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Available Days",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(0, 0, 0, 1)),
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        const Icon(
                          Icons.calendar_today_outlined,
                          size: 16,
                          color: Color.fromRGBO(245, 146, 69, 1),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "October, 2023",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(255, 88, 88, 89)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      child: ListView.builder(
                        // padding: const EdgeInsets.only(top: 10,),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: atime.length,
                        itemBuilder: (context, index) {
                          return Container(
                            // padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(right: 10),
                            // height: 100,
                            width: 70,
                            decoration: BoxDecoration(
                              color: (index == 0)
                                  ? const Color.fromRGBO(245, 146, 69, 1)
                                  : const Color.fromRGBO(255, 255, 255, 1),
                              border: Border.all(
                                  color: const Color.fromRGBO(245, 146, 69, 1)),
                              // color: const Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.circular(19),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  atime[index],
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(0, 0, 0, 1)),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 40,
                      width: 380,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(252, 219, 193, 1),
                      ),
                      child: Text(
                        "See Location",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(245, 146, 69, 1)),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 40,
                      width: 380,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(245, 146, 69, 1),
                      ),
                      child: Text(
                        "Book Now",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
