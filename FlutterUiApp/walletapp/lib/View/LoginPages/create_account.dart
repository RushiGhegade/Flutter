import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'create_account1.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  List<String> logo = [
    "lib/Assets/Images/s1_4.png",
    "lib/Assets/Images/s1_5.png",
    "lib/Assets/Images/s1_6.png",
  ];

  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 235, 250, 1),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Center(
            child: Column(
              children: [
                Image(
                  image: AssetImage(
                    "lib/Assets/Images/s1.png",
                  ),
                  width: 130,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 50,
                ),
                Image(
                  image: AssetImage(
                    "lib/Assets/Images/s1_2.png",
                  ),
                  width: 210,
                  height: 230,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 15, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    SizedBox(
                      height: 30,
                      width: 300,
                      child: Text(
                        softWrap: true,
                        // textAlign:,
                        "Enter your password",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      softWrap: true,
                      // textAlign:,
                      "Password",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        // maxLength: 4,
                        // expands: false,
                        // textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          isDense: true,
                          suffixIcon: const Icon(
                            Icons.visibility_off,
                            color: Color.fromRGBO(83, 93, 102, 1),
                            size: 25,
                          ),
                          hintText: "Enter your password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    // const Spacer(),
                    Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            showsheet(context, true);
                            setState(() {});
                          },
                          child: Text(
                            "Forgot Password",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(29, 98, 202, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const CreateAccount1();
                          },
                        ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(87, 50, 191, 1),
                        ),
                        child: Text(
                          "Continue",
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                    ),
                    //
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showsheet(BuildContext context, bool flag) {
    (flag)
        ? showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      Row(
                        children: [
                          Text(
                            softWrap: true,
                            // textAlign:,
                            "Forgot your password?",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            softWrap: true,
                            // textAlign:,
                            "Done",
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(29, 98, 202, 1)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        softWrap: true,
                        // textAlign:,
                        "Email",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          // maxLength: 4,
                          // expands: false,
                          // textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            isDense: true,
                            // suffix: Icon(Icons.abc),
                            hintText: "e.g. email@example.com",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      // const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const CreateAccount1();
                            },
                          ));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(87, 50, 191, 1),
                          ),
                          child: Text(
                            "Send reset link",
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // const Spacer(),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            showsheet(context, false);
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Use mobile instead",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(29, 98, 202, 1),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        : showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      Row(
                        children: [
                          Text(
                            softWrap: true,
                            // textAlign:,
                            "Forgot your password?",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            softWrap: true,
                            // textAlign:,
                            "Done",
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(29, 98, 202, 1)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        softWrap: true,
                        // textAlign:,
                        "Mobile Number",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          // maxLength: 4,
                          // expands: false,
                          // textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            isDense: true,
                            // suffix: Icon(Icons.abc),
                            hintText: "e.g. email@example.com",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      // const Spacer(),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(
                          // builder: (context) {
                          // return const CreateAccount();
                          // },
                          // ));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(87, 50, 191, 1),
                          ),
                          child: Text(
                            "Send reset link",
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // const Spacer(),
                      Center(
                        child: Text(
                          "Use Email instead",
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(29, 98, 202, 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
