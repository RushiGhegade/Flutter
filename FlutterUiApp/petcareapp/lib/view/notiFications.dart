import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcareapp/view/dashboard.dart';

class NotiFications extends StatefulWidget {
  const NotiFications({super.key});

  @override
  State<NotiFications> createState() => _NotiFicationsState();
}

class _NotiFicationsState extends State<NotiFications> {
  List<Map<String, dynamic>> data = [
    {
      "Icon": const Icon(Icons.shopping_bag_outlined,
          color: Color.fromRGBO(245, 146, 69, 1)),
      "text": "Your checkout is successfull, product is on tne way",
    },
    {
      "Icon": const Icon(Icons.done, color: Color.fromRGBO(245, 146, 69, 1)),
      "text": "Appointment request accepted",
    },
    {
      "Icon": const Icon(Icons.favorite_border,
          color: Color.fromRGBO(245, 146, 69, 1)),
      "text": "Vaccinate your pet timely",
    },
  ];

  List<String> day = [
    "Today",
    "25 September",
    "15 September",
    "21 October",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.9),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
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
                    "Notifications",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(31, 32, 41, 1)),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Today",
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(31, 32, 41, 1)),
              ),
              ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 160,
                      width: 250,
                      // margin: EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromRGBO(255, 255, 255, 1)),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromRGBO(
                                            252, 219, 193, 1)),
                                    child: data[index]['Icon'],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    data[index]['text'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(
                                            31, 32, 41, 1)),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 17,
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 17,
                        ),
                        Text(
                          day[index + 1],
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(31, 32, 41, 1)),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                      ],
                    );
                  },
                  itemCount: day.length)
            ],
          ),
        ),
      ),
    );
  }
}
