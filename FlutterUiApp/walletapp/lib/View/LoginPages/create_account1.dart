import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletapp/View/LoginPages/opt.dart';

class CreateAccount1 extends StatefulWidget {
  const CreateAccount1({super.key});

  @override
  State<CreateAccount1> createState() => _CreateAccount1State();
}

class _CreateAccount1State extends State<CreateAccount1> {
  List<String> logo = [
    "lib/Assets/Images/s1_4.png",
    "lib/Assets/Images/s1_5.png",
    "lib/Assets/Images/s1_6.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(239, 235, 250, 1),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Text(
                "< Back",
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(29, 98, 202, 1),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3.9,
              ),
              const Image(
                image: AssetImage(
                  "lib/Assets/Images/s1.png",
                ),
                // width: 130,
                fit: BoxFit.cover,
              ),
            ],
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
                    const SizedBox(
                      height: 150,
                    ),
                    SizedBox(
                      // height: 60,
                      width: 290,
                      child: Text(
                        softWrap: true,
                        // textAlign:,
                        "Create Account",
                        style: GoogleFonts.poppins(
                          fontSize: 25,
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
                      "Name",
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

                          hintText: "e.g. John Doe",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
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
                          // suffix: Icon(Icons.abc),

                          hintText: "Enter your password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Row(
                      children: [
                        Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(border: Border.all()),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "I accept terms and conditions and privacy policy",
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(25, 25, 25, 1),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const Otp();
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
                    // const SizedBox(
                    //   height: 30,
                    // ),
                    const Spacer(),
                    Row(
                      children: [
                        const Text(
                          "----------------------------",
                          style: TextStyle(
                            // fontSize: 13,
                            // fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 186, 182, 182),
                          ),
                        ),
                        Text(
                          "  or continue using  ",
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 186, 182, 182),
                          ),
                        ),
                        const Text(
                          "----------------------------",
                          style: TextStyle(
                            // fontSize: 13,
                            // fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 186, 182, 182),
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    const Spacer(),
                    SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: logo.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 36),
                            height: 20,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 216, 217, 221))),
                            child: Image(
                              image: AssetImage(logo[index]),
                            ),
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
