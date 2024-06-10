import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcareapp/view/bottom_navigation.dart';
import 'package:petcareapp/view/floating.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

List<String> images = [
  "lib/images/Pet Shop (4).png",
  "lib/images/Pet Shop (5).png",
  "lib/images/Pet Shop (1).png",
  "lib/images/Pet Shop (2).png",
  "lib/images/Pet Shop (3).png",
  "lib/images/Pet Shop.png",
];

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                height: 148,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(245, 146, 69, 1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello Sarah",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 1)),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Find your lovable Pets",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 1)),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.shopping_cart,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 125, left: 60),
                child: SizedBox(
                  height: 40,
                  width: 290,
                  child: TextFormField(
                    textAlign: TextAlign.left,
                    cursorHeight: 20,
                    // enabled: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromRGBO(255, 255, 255, 1),
                      suffixIcon: const Icon(
                        Icons.search,
                        size: 30,
                        color: Color.fromARGB(245, 255, 137, 35),
                      ),
                      labelText: "Search Something Here...",
                      labelStyle: const TextStyle(fontSize: 17),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              width: 2,
                              color: Color.fromRGBO(245, 146, 69, 0.8))),
                    ),
                  ),
                ),
              ),
            ],
          ),
          GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: images.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
            itemBuilder: (context, index) {
              return Image(image: AssetImage(images[index]));
            },
          ),
        ],
      ),
      floatingActionButton: const Floating(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNavigations(),
    );
  }
}
