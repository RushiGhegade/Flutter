import 'package:fashionapp_ui/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<String> list = [
    "S",
    "M",
    "L",
    "XL",
    "XXL",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
          ),
          Row(
            children: [
              // const SizedBox(
              //   width: 20,
              // ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Home();
                    },
                  ));
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                ),
              ),
              const Spacer(),
              Text(
                "Details",
                style: GoogleFonts.imprima(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(13, 13, 14, 1),
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.bookmark_border,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 450,
            width: 360,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              image: DecorationImage(
                image: AssetImage("lib/Images/h1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              // const SizedBox(
              //   width: 20,
              // ),
              SizedBox(
                height: 100,
                width: 200,
                child: Text(
                  "Premium Tagerine Shirt",
                  style: GoogleFonts.imprima(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(13, 13, 14, 1)),
                ),
              ),
              const Spacer(),
              const Image(
                image: AssetImage("lib/Images/Options.png"),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
          Text(
            "Size",
            style: GoogleFonts.imprima(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: const Color.fromRGBO(13, 13, 14, 1)),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                height: 60,
                // width: ,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 60,
                      width: 60,
                      margin: const EdgeInsets.only(right: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: (index == 2)
                            ? const Color.fromRGBO(13, 13, 14, 1)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        list[index],
                        style: GoogleFonts.imprima(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: (index != 2)
                              ? const Color.fromRGBO(13, 13, 14, 1)
                              : Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "\$257.85",
                style: GoogleFonts.imprima(
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              const Spacer(),
              Container(
                height: 60,
                width: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(40),
                  color: const Color.fromRGBO(255, 122, 0, 1),
                ),
                child: Text(
                  "Add To Cart",
                  style: GoogleFonts.imprima(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
