import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletapp/View/MainScreen/bottom_navigation_bar.dart';
import 'package:walletapp/View/MainScreen/setting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> list = [
    {
      "Image": "",
      "Name": "Add",
    },
    {
      "Image": "lib/Assets/Images/s2_1.png",
      "Name": "Ali",
    },
    {
      "Image": "lib/Assets/Images/s2_2.png",
      "Name": "Steve",
    },
    {
      "Image": "lib/Assets/Images/s2_3.png",
      "Name": "Ahmed",
    },
    {
      "Image": "lib/Assets/Images/s2_4.png",
      "Name": "Raj",
    },
  ];

  List<Map<String, String>> info = [
    {
      "Image": "lib/Assets/Images/s2_5.png",
      "Name": "Walmart",
      "Date": "Today 12:32",
      "Price": "-\$35.23 >",
    },
    {
      "Image": "lib/Assets/Images/Topup.png",
      "Name": "Top up",
      "Date": "Yesterday 02:12",
      "Price": "+\$430.00 >",
    },
    {
      "Image": "lib/Assets/Images/s2_6.png",
      "Name": "Netflix",
      "Date": "Dec 24 13:53",
      "Price": "-\$13.00 >",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(39, 6, 133, 1),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Row(
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("lib/Assets/Images/s2_1.png"),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 50,
                  width: 60,
                  child: Text(
                    "Hello, Rushi !",
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const Setting();
                      },
                    ));
                  },
                  child: const Icon(
                    Icons.settings,
                    size: 30,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Container(
              height: 178,
              width: MediaQuery.of(context).size.width / 1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(163, 79, 48, 173)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Main balance",
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(178, 161, 228, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          "\$14,235.34",
                          style: GoogleFonts.poppins(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Icon(
                            Icons.arrow_upward_rounded,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Top up",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(255, 255, 255, 1),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.arrow_downward_rounded,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Withdraw",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(255, 255, 255, 1),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.recycling_outlined,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Transfer",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(255, 255, 255, 1),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 15, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Recent Transfers",
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(25, 25, 25, 1),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        // padding: const EdgeInsets.only(left: 10),
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 25),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  // margin: const EdgeInsets.only(right: 25),
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        const Color.fromRGBO(230, 221, 255, 1),
                                    image: (index == 0)
                                        ? null
                                        : DecorationImage(
                                            image: AssetImage(
                                                list[index]['Image']!)),
                                  ),
                                  child: (index == 0)
                                      ? const Icon(Icons.add)
                                      : null,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  list[index]['Name']!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(25, 25, 25, 1),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          "Latest Transactions",
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(25, 25, 25, 1),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "View all",
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(107, 107, 107, 1),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: info.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image:
                                            AssetImage(info[index]['Image']!),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      info[index]['Name']!,
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            const Color.fromRGBO(25, 25, 25, 1),
                                      ),
                                    ),
                                    // const SizedBox(
                                    //   height: 10,
                                    // ),
                                    Text(
                                      info[index]['Date']!,
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            const Color.fromRGBO(25, 25, 25, 1),
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  info[index]['Price']!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: (index == 1)
                                        ? Colors.green
                                        : Color.fromARGB(255, 250, 4, 4),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width,
                              color: const Color.fromARGB(43, 64, 63, 63),
                            )
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
