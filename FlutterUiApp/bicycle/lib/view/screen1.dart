import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import "Screen2.dart";

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(53, 63, 84, 0.6),
      body: Column(
        children: [
          Stack(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50, left: 160),
                child: Image(image: AssetImage("lib/images/s1.png")),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 313),
                child: Image(
                  image: AssetImage("lib/images/Rectangle 1.png"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40, left: 300),
                child: Image(
                  image: AssetImage("lib/images/EXTREME.png"),
                  height: 800,
                  width: 100,
                  opacity: AlwaysStoppedAnimation(0.7),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 250, left: 20),
                child: Image(image: AssetImage("lib/images/s1_2.png")),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 770, left: 210),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Screen2();
                      },
                    ));
                  },
                  child: Container(
                    height: 65,
                    width: 210,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                      color: Color.fromRGBO(36, 44, 59, 1),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 3,
                        ),
                        Container(
                          height: 58,
                          width: 58,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4,
                                  color: const Color.fromRGBO(239, 186, 51, 1)),
                              shape: BoxShape.circle,
                              color: const Color.fromRGBO(75, 76, 237, 1)),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Get Start",
                          style: GoogleFonts.poppins(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(255, 255, 255, 1)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
