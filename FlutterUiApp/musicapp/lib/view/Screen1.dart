import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/view/Screen2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "lib/Images/s1.jpg",
              ),
              fit: BoxFit.cover)),
      // child: const Column(),
      child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            SizedBox(
              width: 314,
              height: 140,
              child: Text(
                "Dancing between The shadows Of rhythm ",
                style: GoogleFonts.inter(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(255, 255, 255, 1)),
              ),
            ),
            const SizedBox(
              height: 30,
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
                height: 47,
                width: 261,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19),
                  color: const Color.fromRGBO(255, 46, 0, 1),
                ),
                child: Text(
                  "Get started",
                  style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(19, 19, 19, 1)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 47,
              width: 261,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19),
                  // color: const Color.fromRGBO(255, 46, 0, 1),
                  border:
                      Border.all(color: const Color.fromRGBO(255, 46, 0, 1))),
              child: Text(
                "Continue with Email",
                style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(255, 46, 0, 1)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 227,
              height: 38,
              child: Text(
                "by continuing you agree to terms of services and  Privacy policy",
                style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(203, 200, 200, 1)),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    ));
  }
}
