import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcareapp/view/dashboard.dart';
import 'package:petcareapp/view/detail_doctor.dart';

class Traning extends StatefulWidget {
  const Traning({super.key});

  @override
  State<Traning> createState() => _TraningState();
}

/*
lib/images/Frame 2061.png
    - lib/images/Frame 2061 (3).png
    - lib/images/Frame 2061 (2).png
    - lib/images/Frame 2061 (1).png
*/
class _TraningState extends State<Traning> {
  List<Map<String, dynamic>> vedeos = [
    {
      "image": "lib/images/Frame 2061 (1).png",
      "name": "Obedience Courses",
      "degree": "By Jhon Smith",
      "star": "4.9(335)",
    },
    {
      "image": "lib/images/Frame 2061 (3).png",
      "name": "Specialty Classes & Workshops",
      "degree": "By Duke Fuzzington",
      "star": "4.9(500)",
    },
    {
      "image": "lib/images/Frame 2061 (2).png",
      "name": "Puppy Kinderganten and Playgroups",
      "degree": "By Sir Fluffington",
      "star": "5.0(500)",
    },
    {
      "image": "lib/images/Frame 2061 (1).png",
      "name": "Canine Good Citizen Test",
      "degree": "By Baron Fuzzypaws",
      "star": "4.8(500)",
    },
    {
      "image": "lib/images/Frame 2061 (3).png",
      "name": "Theraphy Dogs",
      "degree": "By Duke Fuzzington",
      "star": "5.0(500)",
    },
    {
      "image": "lib/images/Frame 2061 (3).png",
      "name": "Specialty Classes & Workshops",
      "degree": "By Duke Fuzzington",
      "star": "4.9(500)",
    },
    {
      "image": "lib/images/Frame 2061 (2).png",
      "name": "Puppy Kinderganten and Playgroups",
      "degree": "By Sir Fluffington",
      "star": "5.0(500)",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const Dashboard();
                        },
                      ));
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(245, 146, 69, 1)),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Grooming",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(31, 32, 41, 1)),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: vedeos.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const DetailDoctor();
                        }));
                      },
                      child: Container(
                        height: 120,
                        width: 390,
                        margin: const EdgeInsets.only(
                            top: 10, bottom: 20, left: 10, right: 10),
                        padding: const EdgeInsets.only(top: 13),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(22, 34, 51, 0.4),
                                blurRadius: 9,
                                // offset: Offset(7, 7),
                              )
                            ],
                            borderRadius: BorderRadius.circular(16),
                            color: const Color.fromRGBO(255, 255, 255, 1)),
                        child: Row(
                          children: [
                            Container(
                              width: 140,
                              height: 140,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage(vedeos[index]['image']),
                                      fit: BoxFit.cover)),
                              child: const Icon(
                                Icons.play_circle_outline,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  // const SizedBox(
                                  //   height: 20,
                                  // ),
                                  SizedBox(
                                    // height: 50,
                                    width: 200,
                                    child: Text(
                                      vedeos[index]['name'],
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              const Color.fromRGBO(0, 0, 0, 1)),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    vedeos[index]['degree'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromARGB(
                                            255, 98, 98, 100)),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star_border,
                                        size: 20,
                                        color: Color.fromRGBO(245, 146, 69, 1),
                                      ),
                                      Text(
                                        vedeos[index]['star'],
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromARGB(
                                                255, 98, 98, 100)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
