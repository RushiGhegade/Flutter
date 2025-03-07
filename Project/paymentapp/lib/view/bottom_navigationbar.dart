import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Positioned(
              top: 80,
              left: 30,
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                            border: Border(
                              top: BorderSide(
                                  color: Color.fromRGBO(112, 110, 110, 1),
                                  width: 1.5),
                              left: BorderSide(
                                  color: Color.fromRGBO(112, 110, 110, 1),
                                  width: 1.5), // Left border
                              right: BorderSide(
                                  color: Color.fromRGBO(112, 110, 110, 1),
                                  width: 1.5), // Right border
                            ),
                          ),
                          child: Image.asset(
                            "lib/images/Group 73.png",
                            color: Color.fromRGBO(112, 110, 110, 1),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Home",
                        style: GoogleFonts.poppins(
                          color: Color.fromRGBO(112, 110, 110, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.48,
                  ),
                  Column(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                            border: Border(
                              top: BorderSide(
                                  color: Color.fromRGBO(112, 110, 110, 1),
                                  width: 1.5),
                              left: BorderSide(
                                  color: Color.fromRGBO(112, 110, 110, 1),
                                  width: 1.5), // Left border
                              right: BorderSide(
                                  color: Color.fromRGBO(112, 110, 110, 1),
                                  width: 1.5), // Right border
                            ),
                          ),
                          child: Image.asset(
                            "lib/images/Frame 142.png",
                          )),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "ginie",
                        style: GoogleFonts.poppins(
                          color: Color.fromRGBO(112, 110, 110, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          Positioned(
            top: 50,
            left: MediaQuery.of(context).size.width * 0.35,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 85,
                  width: 85,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    border: Border(
                      top: BorderSide(
                          color: Color.fromRGBO(255, 255, 255, 1), width: 1.5),
                      left: BorderSide(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          width: 1.5), // Left border
                      right: BorderSide(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          width: 1.5), // Right border
                    ),
                  ),
                  child: Icon(
                    Icons.qr_code_scanner_outlined,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    size: 37,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  "Yelo pay",
                  style: GoogleFonts.poppins(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          CustomPaint(
            size: Size(
                MediaQuery.of(context).size.width, 80), 
            painter: TopCurvePainter(),
          ),
        ],
      ),
    );
  }
}

class TopCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(
      size.width * 0.5,
      0,
      size.width,
      size.height,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
