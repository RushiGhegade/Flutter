import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcareapp/view/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 146, 69, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Login();
                }));
              },
              child: const Image(
                image: AssetImage("lib/images/Group 12.png"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "PetGuardian",
              style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(255, 255, 255, 1)),
            ),
            Text(
              "“Your Pets' Lifelong Protector",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(255, 255, 255, 1)),
            ),
          ],
        ),
      ),
    );
  }
}
