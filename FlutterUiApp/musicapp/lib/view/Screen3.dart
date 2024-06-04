import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/view/bottomClass.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 561,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/Images/s2_2.jpg"), fit: BoxFit.fill),
            ),
            child: Center(
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    "Alone in the Abyss",
                    style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(230, 154, 21, 1)),
                  ),
                  Text(
                    "Youlakou",
                    style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Image.asset("lib/Images/radix-icons_share-2.png"),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 248.4,
            width: double.infinity,
            decoration:
                const BoxDecoration(color: Color.fromRGBO(19, 19, 19, 1)),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Dynamic Warmup | ",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(255, 255, 255, 1)),
                    ),
                    const Spacer(),
                    Text(
                      "4min",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(255, 255, 255, 1)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 6,
                  width: 390,
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    value: 0.3,
                    valueColor:
                        AlwaysStoppedAnimation(Color.fromRGBO(230, 154, 21, 1)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Spacer(),
                    Icon(
                      Icons.loop_rounded,
                      size: 25,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    Spacer(),
                    Icon(
                      Icons.skip_previous,
                      size: 35,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    Spacer(),
                    Icon(
                      Icons.play_circle_fill_outlined,
                      size: 75,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    Spacer(),
                    Icon(
                      Icons.skip_next,
                      size: 35,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    Spacer(),
                    Icon(
                      Icons.volume_up,
                      size: 25,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    Spacer(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomClass(),
    );
  }
}
