import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletapp/View/MainScreen/home_Screen.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State createState() {
    return _OtpState();
  }
}

class _OtpState extends State {
  int len = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  width: 350,
                  child: Text(
                    "An SMS sent to your mobile number +962 79 XXX-XXXX",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 30,
                  width: 350,
                  child: Text(
                    "Enter six-digit code",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(120, 131, 141, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: 200,
                  child: TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      setState(() {
                        len = value.length;
                      });
                      if (len == 6) {
                        Future.delayed(const Duration(seconds: 3), () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const HomeScreen();
                            },
                          ));
                        });
                      }
                    },
                    maxLength: 6,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "XXX-XXX",
                      suffixIcon: (len == 6)
                          ? const Icon(
                              Icons.file_download_done_rounded,
                              color: Colors.green,
                              size: 40,
                            )
                          : null,
                      hintStyle: const TextStyle(
                        fontSize: 30,
                        color: Color.fromRGBO(120, 131, 141, 1),
                      ),
                      enabled: true,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(87, 50, 191, 1),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 30,
                  width: 200,
                  child: Row(
                    children: [
                      Text(
                        "Resend code :",
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: (len == 6)
                              ? const Color.fromRGBO(29, 98, 202, 1)
                              : const Color.fromRGBO(120, 131, 141, 1),
                        ),
                      ),
                      Text(
                        " 00:30",
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(0, 0, 0, 1),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
