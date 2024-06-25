import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcareapp/view/bottom_navigation.dart';
import 'package:petcareapp/view/detail_doctor.dart';
import 'package:petcareapp/view/floating.dart';
import 'package:petcareapp/view/main.dart';
import 'package:provider/provider.dart';

class Veterinary extends StatefulWidget {
  const Veterinary({super.key});

  @override
  State<Veterinary> createState() => _VeterinaryState();
}

class _VeterinaryState extends State<Veterinary> {
  TextEditingController controllert = TextEditingController();

  List<dynamic> found = [];
  List<dynamic> origanal = [];
  searchResult(String value) {
    List<dynamic> result = [];

    if (value.isEmpty) {
      result = origanal;
    } else {
      result = origanal.where((element) {
        return element['Name'].toLowerCase().contains(value.toLowerCase());
      }).toList();
    }
    found = result;
    setState(() {});
  }

  List<Map<String, dynamic>> data = [
    {"image": "lib/images/s4_1.jpg", "name": "Vaccinations"},
    {"image": "lib/images/s4_2.jpg", "name": "Operations"},
    {"image": "lib/images/s4_3.jpg", "name": "Behaviorals"},
    {"image": "lib/images/s4_4.jpg", "name": "Dentistry"},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        setState(() {
          origanal = Provider.of<DoctorInfo>(context, listen: false).info();
          found = Provider.of<DoctorInfo>(context, listen: false).info();
        });
      },
    );

  }

  @override
  Widget build(BuildContext context) {
    // found = Provider.of<DoctorInfo>(context).info();

    return Scaffold(
      floatingActionButton: const Floating(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNavigations(),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.9),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Color.fromRGBO(245, 146, 69, 1),
                  ),
                  Text(
                    "London, UK",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 124, 124, 126)),
                  ),
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
                        child: Text(
                          "Lets Find Specialist Doctor for Your Pet!",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(255, 255, 255, 1)),
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
                        "lib/images/s4.jpg",
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
                  onChanged: (value) {
                    searchResult(value);
                    setState(() {});
                  },
                  // textAlign: TextAlign.left,

                  // cursorHeight: 20,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.search,
                      size: 30,
                      color: Color.fromARGB(245, 255, 137, 35),
                    ),
                    hintText: "search",
                    labelStyle: const TextStyle(fontSize: 17),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            width: 2,
                            color: Color.fromRGBO(245, 146, 69, 0.8))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            width: 2,
                            color: Color.fromRGBO(245, 146, 69, 0.8))),
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Row(
                children: [
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
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 100,
                width: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 22),
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                    data[index]['image'],
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            data[index]['name'],
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(0, 0, 0, 1)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Best Specialists Nearby",
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(0, 0, 0, 1)),
              ),
              Container(
                height: 390,
                width: double.infinity,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: found.length,
                    // itemCount: Provider.of<DoctorInfo>(context, listen: false)
                    //     .info()
                    //     .length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Provider.of<DoctorInfo>(context, listen: false)
                              .indexC(index);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const DetailDoctor();
                          }));
                        },
                        child: Container(
                          height: 150,
                          width: 390,
                          margin: const EdgeInsets.only(bottom: 25),
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(22, 34, 51, 0.08),
                                  blurRadius: 9,
                                  // offset: Offset(7, 7),
                                )
                              ],
                              borderRadius: BorderRadius.circular(16),
                              color: const Color.fromRGBO(255, 255, 255, 0.7)),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image:
                                            AssetImage(found[index]['Image']),
                                        // Provider.of<DoctorInfo>(context,
                                        //         listen: false)
                                        //     .info()[index]['Image']),
                                        fit: BoxFit.cover)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      found[index]['Name'],
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              const Color.fromRGBO(0, 0, 0, 1)),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      found[index]['degree'],
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromARGB(
                                              255, 98, 98, 100)),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star_border,
                                          color:
                                              Color.fromRGBO(245, 146, 69, 1),
                                        ),
                                        Text(
                                          found[index]['star'],
                                          style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromARGB(
                                                  255, 98, 98, 100)),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Icon(
                                          Icons.star_border,
                                          color:
                                              Color.fromRGBO(245, 146, 69, 1),
                                        ),
                                        Text(
                                          found[index]['distance'],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
