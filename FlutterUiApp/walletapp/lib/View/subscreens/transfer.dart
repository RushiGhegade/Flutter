import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletapp/View/subscreens/MonyEnter.dart';

class Transfer extends StatefulWidget {
  const Transfer({super.key});

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  List<Map<String, dynamic>> list = [
    {
      "Image": "lib/Assets/Images/s2_1.png",
      "Name": "Shriram Khade",
      "Phone": "+91 1234567890",
      "Price": "",
    },
    {
      "Image": "lib/Assets/Images/s2_2.png",
      "Phone": "+91 1234567890",
      "Name": "Abhay Gaikwad",
      "Price": "",
    },
    {
      "Image": "lib/Assets/Images/s2_3.png",
      "Phone": "+91 1234567890",
      "Name": "Pavan Ghadge",
      "Price": "",
    },
  ];

  List<Map<String, dynamic>> allContacts = [
    {
      "Image": "lib/Assets/Images/s2_1.png",
      "Name": "Shriram Khade",
      "Phone": "+91 1234567890",
      "Price": "",
    },
    {
      "Image": "lib/Assets/Images/s2_2.png",
      "Phone": "+91 1234567890",
      "Name": "Abhay Gaikwad",
      "Price": "",
    },
    {
      "Image": "lib/Assets/Images/s2_3.png",
      "Phone": "+91 1234567890",
      "Name": "Pavan Ghadge",
      "Price": "",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "< Back",
                          style: GoogleFonts.poppins(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(29, 98, 202, 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Pay to",
                style: GoogleFonts.poppins(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(230, 221, 255, 1),
                    ),
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "New biller",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(25, 25, 25, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    "----------------------------------------- ",
                    style: TextStyle(color: Color.fromRGBO(178, 179, 184, 1)),
                  ),
                  Text(
                    "Or",
                    style: TextStyle(color: Color.fromRGBO(78, 78, 80, 1)),
                  ),
                  Text(
                    " -----------------------------------------",
                    style: TextStyle(color: Color.fromRGBO(178, 179, 184, 1)),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search biller",
                    hintStyle: TextStyle(
                        height: 4.5, color: Color.fromRGBO(178, 179, 184, 1)),
                    prefixIcon: Icon(Icons.search,
                        color: Color.fromRGBO(178, 179, 184, 1)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(178, 179, 184, 1))),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Frequent contacts",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(25, 25, 25, 1),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MonyEnter(map: allContacts[index]);
                          }));
                          setState(() {});
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(list[index]['Image']))),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  list[index]["Name"],
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(25, 25, 25, 1),
                                  ),
                                ),
                                Text(
                                  list[index]["Phone"],
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(25, 25, 25, 1),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromRGBO(83, 93, 102, 1),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Container(
                        height: 1,
                        color: const Color.fromARGB(255, 166, 164, 164),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "All contacts",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(25, 25, 25, 1),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          // ShowBottombar(index);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MonyEnter(map: allContacts[index]);
                          }));
                          setState(() {});
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          allContacts[index]['Image']))),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  allContacts[index]["Name"],
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(25, 25, 25, 1),
                                  ),
                                ),
                                Text(
                                  allContacts[index]["Phone"],
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(25, 25, 25, 1),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromRGBO(83, 93, 102, 1),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Container(
                        height: 1,
                        color: const Color.fromARGB(255, 166, 164, 164),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                    ],
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
