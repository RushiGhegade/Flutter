import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletapp/View/MainScreen/About.dart';
import 'package:walletapp/View/MainScreen/bottom_navigation_bar.dart';
import 'package:walletapp/View/subscreens/Paybills.dart';
import 'package:walletapp/View/subscreens/transfer.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  List<Map<String, String>> icon = [
    {
      "image": "lib/Assets/Images/Icon.png",
      "Name": "Pay bills",
    },
    {
      "image": "lib/Assets/Images/Icon (1).png",
      "Name": "Transfer",
    },
    {
      "image": "lib/Assets/Images/Icon (2).png",
      "Name": "Topup",
    },
    {
      "image": "lib/Assets/Images/Icon (3).png",
      "Name": "Withdraw",
    },
    {
      "image": "lib/Assets/Images/Icon (4).png",
      "Name": "Analytics",
    },
    {
      "image": "lib/Assets/Images/Icon (5).png",
      "Name": "Help",
    },
    {
      "image": "lib/Assets/Images/Icon (6).png",
      "Name": "Contact us",
    },
    {
      "image": "lib/Assets/Images/Icon (7).png",
      "Name": "About",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Text(
                "More",
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(25, 25, 25, 1),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    String str = icon[index]['Name']!.toLowerCase();

                    if (str == "about") {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const About();
                        },
                      ));
                    } else if (str == "pay bills") {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const PayBills();
                        },
                      ));
                    } else if (str == 'transfer') {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const Transfer();
                        },
                      ));
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 15,
                      top: 15,
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(icon[index]['image']!))),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          icon[index]['Name']!,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(25, 25, 25, 1),
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  margin: (index == icon.length - 4)
                      ? null
                      : const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                  height: (index == icon.length - 4) ? 7 : 3,
                  color: const Color.fromRGBO(237, 239, 246, 1),
                );
              },
              itemCount: icon.length,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
