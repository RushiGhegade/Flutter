import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_app/view/EndScreen.dart';
import 'package:home_app/view/main.dart';
import 'package:home_app/view/screen2.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class Screen3 extends StatefulWidget {
  final int num;

  const Screen3({super.key, required this.num});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  bool isFinish = false;
  @override
  void initState() {
    list = (widget.num == 0)
        ? Provider.of<HomeInfo>(context, listen: false).homeInfo()
        : Provider.of<HomeInfo>(context, listen: false).NearByLoc;
    super.initState();
  }

  List<Map<String, dynamic>> list = [];

  List<Map<String, dynamic>> map = [
    {
      "icon": const Icon(
        Icons.bed,
        color: Color.fromRGBO(90, 90, 90, 1),
      ),
      "name": "Bedrooms",
      "quantity": "5",
    },
    {
      "icon": const Icon(Icons.bathtub_rounded,
          color: Color.fromRGBO(90, 90, 90, 1)),
      "name": "Bathrooms",
      "quantity": "5"
    },
    {
      "icon": const Icon(Icons.square_outlined,
          color: Color.fromRGBO(90, 90, 90, 1)),
      "name": "Square ft",
      "quantity": "6,000 sq ft"
    }
  ];
  @override
  Widget build(BuildContext context) {
    log("$list");

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.9),
      body: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          // Text("${widget.num}"),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(PageTransition(
                      child: const Screen2(),
                      type: PageTransitionType.rightToLeft));
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  size: 22,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
              const Spacer(),
              Text(
                "Details",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 280, //244
            width: 390,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    image: AssetImage(list[indexs]['image']),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 260,
                    child: Text(
                      list[indexs]['name'],
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                  Text(
                    list[indexs]['location'],
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(72, 72, 72, 1),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "\$${list[indexs]['price'].substring(0, 5)}",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(32, 169, 247, 1),
                ),
              ),
              Text(
                "/Month",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(72, 72, 72, 1),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 141,
                width: 400,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: map.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 141,
                      width: 112,
                      margin: const EdgeInsets.only(right: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Column(
                        children: [
                          const Spacer(),
                          map[index]['icon'],
                          const Spacer(),
                          Text(
                            map[index]['name'],
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(90, 90, 90, 1),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "${map[index]['quantity']}",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 120,
            child: SingleChildScrollView(
              child: SizedBox(
                // height: 150,
                width: 390,
                child: Text(
                  "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: SwipeableButtonView(
              buttonText: "Rent Now",
              buttonColor: const Color.fromRGBO(32, 169, 247, 1),
              buttonWidget: Container(
                height: 68,
                width: 68,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      list[indexs]['image'],
                    ),
                  ),
                ),
                // child: const Icon(
                //   Icons.arrow_forward,
                //   size: 32,
                // ),
              ),
              buttontextstyle: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
              isFinished: isFinish,
              onFinish: () async {
                await Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const EndScreen();
                  },
                ));
                setState(() {
                  isFinish = true;
                });
              },
              activeColor: const Color.fromRGBO(32, 169, 247, 1),
              onWaitingProcess: () {
                Future.delayed(const Duration(seconds: 1), () {
                  setState(() {
                    isFinish = true;
                  });
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
