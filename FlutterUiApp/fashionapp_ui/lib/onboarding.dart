import 'package:fashionapp_ui/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 560,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(40),
                image: const DecorationImage(
                    image: AssetImage("lib/Images/s1.jpg"), fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 120,
                  width: 310,
                  child: Text(
                    "Find The Best Collections",
                    style: GoogleFonts.imprima(
                      fontSize: 42,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                  width: 310,
                  child: Text(
                    "Get your dream item easily with FashionHub and get other intersting offer",
                    style: GoogleFonts.imprima(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(121, 119, 128, 1)),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 60,
                width: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(40),
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Text(
                  "Sign Up",
                  style: GoogleFonts.imprima(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
              // const SizedBox(
              //   width: 20,
              // ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return const Home();
                  // }));
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Home();
                    },
                  ));
                },
                child: Container(
                  height: 60,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(40),
                    color: const Color.fromRGBO(255, 122, 0, 1),
                  ),
                  child: Text(
                    "Sign In",
                    style: GoogleFonts.imprima(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
