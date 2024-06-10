import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_app/view/screen2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 631,
            // width: 390,
            child: const Image(
                image: AssetImage("lib/images/s1.jpg"), fit: BoxFit.cover),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Lets find your Paradise",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: Text(
                    "Find your perfect dream space with just a few clicks",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(101, 101, 101, 1),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const Screen2();
                      },
                    ));
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      width: 270,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: const Color.fromRGBO(32, 169, 247, 1),
                      ),
                      child: Text(
                        "Get Started",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
