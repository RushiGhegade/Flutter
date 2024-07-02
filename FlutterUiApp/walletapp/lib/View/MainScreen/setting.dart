import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  List<Map<String, String>> icon = [
    {
      "image": "lib/Assets/Images/Icon (8).png",
      "Name": "Rushikesh Ghegade",
    },
    {
      "image": "lib/Assets/Images/Icon (9).png",
      "Name": "+91 8530321810",
    },
    {
      "image": "lib/Assets/Images/Icon (10).png",
      "Name": "ghegaderushikesh065@gmail.com",
    },
    {
      "image": "lib/Assets/Images/Icon (11).png",
      "Name": "Change Password",
    },
  ];

  List<String> field = ["Full Name", "Mobile", "Email"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "< Back",
                    style: GoogleFonts.sora(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(29, 98, 202, 1),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
                Text(
                  "Profile Settings",
                  style: GoogleFonts.sora(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(25, 25, 25, 1),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(29, 98, 202, 1)),
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("lib/Assets/Images/s2_1.png"))),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Rushikesh Ghegade",
              style: GoogleFonts.sora(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              "Joined 2 years ago",
              style: GoogleFonts.sora(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(120, 131, 141, 1),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: icon.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(icon[index]['image']!),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (index < field.length) ? field[index] : "",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromARGB(255, 49, 51, 53),
                              ),
                            ),
                            Text(
                              icon[index]['Name']!,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(25, 25, 25, 1),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        (index < field.length)
                            ? Text(
                                "Edit",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(29, 98, 202, 1),
                                ),
                              )
                            : const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 1,
                      color: const Color.fromARGB(255, 186, 188, 194),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
