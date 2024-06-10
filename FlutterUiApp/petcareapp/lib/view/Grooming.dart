import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:petcareapp/view/dashboard.dart';

class Grooming extends StatefulWidget {
  const Grooming({super.key});

  @override
  State<Grooming> createState() => _GroomingState();
}

class _GroomingState extends State<Grooming> {
  List<Map<String, dynamic>> image = [
    {"image": "lib/images/image (1).png", "name": "Bathing & Drying"},
    {"image": "lib/images/image (2).png", "name": "Hair Triming"},
    {"image": "lib/images/image (3).png", "name": "Nail Trimming"},
    {"image": "lib/images/image (4).png", "name": "Ear Cleaning"},
    {"image": "lib/images/image (5).png", "name": "Bathing & Drying"},
    {"image": "lib/images/image (6).png", "name": "Hair Triming"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
            Container(
              height: 100,
              width: 390,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(22, 34, 51, 0.08),
                      blurRadius: 9,
                      // offset: Offset(7, 7),
                    )
                  ],
                  borderRadius: BorderRadius.circular(16),
                  color: const Color.fromRGBO(245, 146, 69, 1)),
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      height: 80,
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "60% OFF",
                            style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(255, 255, 255, 1)),
                          ),
                          Text(
                            "On hair & spa treatment",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(255, 255, 255, 1)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   width: 10,
                  // ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Image.asset(
                      "lib/images/5_1.jpg",
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 26,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 390,
              child: TextFormField(
                textAlign: TextAlign.left,
                cursorHeight: 20,
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.search,
                    size: 30,
                    color: Color.fromARGB(245, 255, 137, 35),
                  ),
                  labelText: "search",
                  labelStyle: const TextStyle(fontSize: 17),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          width: 2, color: Color.fromRGBO(245, 146, 69, 0.8))),
                ),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Our Services",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(0, 0, 0, 1)),
                ),
                const Spacer(),
                Text(
                  "See All",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 120, 120, 122)),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: image.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(22, 34, 51, 0.7),
                                blurRadius: 9)
                          ]),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 130,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage(image[index]['image']),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Text(
                            image[index]['name'],
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(0, 0, 0, 1)),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
