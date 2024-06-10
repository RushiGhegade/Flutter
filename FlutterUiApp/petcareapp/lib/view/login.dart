import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcareapp/view/dashboard.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              "Login",
              style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(245, 146, 69, 1)),
            ),
            const SizedBox(
              height: 20,
            ),
            const Image(
              image: AssetImage("lib/images/Brandmark Logo.png"),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 112, 112, 114)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 40,
                      width: 360,
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          labelText: "ghegaderushikesh065@gmail.com",
                          hintStyle: const TextStyle(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  width: 2,
                                  color: Color.fromRGBO(250, 200, 162, 1))),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Label",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 112, 112, 114)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 40,
                      width: 360,
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(
                            Icons.remove_red_eye,
                            color: Color.fromARGB(255, 112, 112, 114),
                          ),
                          labelText: "********",
                          hintStyle: const TextStyle(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  width: 2,
                                  color: Color.fromRGBO(250, 200, 162, 1))),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Forgot Password ? Click Here",
              style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(31, 32, 41, 1)),
            ),
            // Dashboard
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Dashboard();
                }));
              },
              child: Container(
                height: 40,
                width: 360,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(245, 146, 69, 1)),
                child: Text(
                  "LOGIN",
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(255, 255, 255, 1)),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
                height: 2,
                width: 360,
                color: const Color.fromRGBO(245, 146, 69, 1)),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 40,
              width: 360,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(245, 146, 69, 1)),
              child: Text(
                "LOGIN WITH EMAIL",
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(255, 255, 255, 1)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 40,
              width: 360,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(245, 146, 69, 1)),
              child: Text(
                "LOGIN WITH FACEBOOK",
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(255, 255, 255, 1)),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              width: 240,
              child: Text(
                "By continue you agree to our Terms & Privacy Policy",
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(31, 32, 41, 1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
