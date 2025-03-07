import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paymentapp/view/bottom_navigationbar.dart';
import 'package:paymentapp/view/fakerdata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ModelClass? modelClass;

  @override
  initState() {
    modelClass = FakerData().getFakeData();
    super.initState();
  }

  bool isFreeze = true;
  bool isShow = true;

  void mySnackBar() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.white,
        content: Text(
          "Details Copy",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget showCard() {
    return Container(
      width: 250,
      height: 400,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(255, 255, 255, 1),
              blurRadius: 2,
              spreadRadius: 0.1,
            )
          ]),
      key: ValueKey<bool>(isFreeze),
      child: Stack(
        children: [
          Positioned(
              left: 15,
              top: 20,
              child: Image.asset(
                "lib/images/logo.png", //lib\images\bankName.png
                fit: BoxFit.cover,
                width: 65,
              )),
          Positioned(
              left: 150,
              top: 5,
              child: Image.asset(
                "lib/images/bankName.png",
                fit: BoxFit.fill,
                width: 90,
              )),
          Positioned(
            top: 80,
            left: 22,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${modelClass!.num1}",
                      style: GoogleFonts.poppins(
                        color: Color.fromRGBO(207, 204, 204, 1),
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${modelClass!.num2}",
                      style: GoogleFonts.poppins(
                        color: Color.fromRGBO(207, 204, 204, 1),
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${modelClass!.num3}",
                      style: GoogleFonts.poppins(
                        color: Color.fromRGBO(207, 204, 204, 1),
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${modelClass!.num4}",
                      style: GoogleFonts.poppins(
                        color: Color.fromRGBO(207, 204, 204, 1),
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),

          Positioned(
            top: 80,
            left: 145,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "expiry",
                  style: GoogleFonts.poppins(
                    color: Color.fromRGBO(102, 101, 101, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  modelClass!.expiry,
                  style: GoogleFonts.poppins(
                    color: Color.fromRGBO(207, 204, 204, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "CVV",
                  style: GoogleFonts.poppins(
                    color: Color.fromRGBO(102, 101, 101, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      isShow ? "${modelClass!.ccv}" : "***",
                      style: GoogleFonts.poppins(
                        color: Color.fromRGBO(207, 204, 204, 1),
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        isShow = !isShow;
                        setState(() {});
                      },
                      child: SizedBox(
                        child: isShow
                            ? Icon(
                                Icons.visibility_off_outlined,
                                color: Colors.red,
                                size: 32,
                              )
                            : Icon(
                                Icons.visibility_outlined,
                                color: Colors.red,
                                size: 32,
                              ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          Positioned(
              top: 295,
              left: 22,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      mySnackBar();
                      setState(() {});
                    },
                    child: Icon(
                      Icons.file_copy_outlined,
                      color: Color.fromRGBO(169, 8, 8, 1),
                      size: 29,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "copy details",
                    style: GoogleFonts.poppins(
                      color: Color.fromRGBO(169, 8, 8, 1),
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )), //lib\images\Union.png

          Positioned(
            top: 340,
            left: 140,
            child: Image.asset(
              "lib/images/Group.png",
              width: 90,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.4),
        body: Padding(
          //horizontal: 15, vertical: 15
          padding:
              const EdgeInsets.only(top: 15, left: 15, right: 10, bottom: 5),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "select payment mode",
                  style: GoogleFonts.poppins(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "choose your preferred payment method to make payment.",
                  style: GoogleFonts.poppins(
                    color: Color.fromRGBO(207, 204, 204, 1),
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      // padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25),
                        border: Border(
                          top: BorderSide(
                              color: Color.fromRGBO(207, 204, 204, 1),
                              width: 1.5), // Top border only
                          left: BorderSide(
                              color: Color.fromRGBO(207, 204, 204, 1),
                              width: 1.5), // Left border
                          right: BorderSide(
                              color: Color.fromRGBO(207, 204, 204, 1),
                              width: 1.5), // Right border
                        ),
                      ),
                      child: Text(
                        "Pay",
                        style: GoogleFonts.poppins(
                          color: Color.fromRGBO(207, 204, 204, 1),
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      // padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25),
                        border: Border(
                          top: BorderSide(
                              color: Color.fromRGBO(169, 8, 8, 1),
                              width: 1.5), // Top border only
                          left: BorderSide(
                              color: Color.fromRGBO(169, 8, 8, 1),
                              width: 1.5), // Left border
                          right: BorderSide(
                              color: Color.fromRGBO(169, 8, 8, 1),
                              width: 1.5), // Right border
                        ),
                      ),
                      child: Text(
                        "card",
                        style: GoogleFonts.poppins(
                          color: Color.fromRGBO(169, 8, 8, 1),
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "your digital debit card",
                  style: GoogleFonts.poppins(
                    color: Color.fromRGBO(141, 139, 139, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      width: 250,
                      height: 400,
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                            scale: animation, // Smooth scale transition
                            child: child,
                          );
                        }, // Animation for Image Swap
                        child: isFreeze
                            ? Image.asset(
                                "lib/images/image.png",
                                key: ValueKey<bool>(
                                    isFreeze), // Smooth Transition
                                fit: BoxFit.fill,
                              )
                            : showCard(),
                      ), //lib\images\image1.png
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isFreeze = !isFreeze;
                              });
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              padding: EdgeInsets.all(18),
                              height:
                                  isFreeze ? 100 : 90, // Animates size change
                              width: isFreeze ? 100 : 90,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isFreeze
                                      ? Colors.red
                                      : Color.fromRGBO(207, 204, 204, 1),
                                  width: isFreeze
                                      ? 3
                                      : 2, // Smooth border thickness change
                                ),
                              ),
                              child: Image.asset(
                                "lib/images/Vector (2).png",
                                fit: BoxFit.cover,
                                color: isFreeze
                                    ? null
                                    : Color.fromRGBO(207, 204, 204, 1),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            isFreeze ? "unfreeze" : "Freeze",
                            style: GoogleFonts.poppins(
                              color: isFreeze
                                  ? Color.fromRGBO(169, 8, 8, 1)
                                  : Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                MyBottomNavigationBar(),
              ],
            ),
          ),
        ));
  }
}
