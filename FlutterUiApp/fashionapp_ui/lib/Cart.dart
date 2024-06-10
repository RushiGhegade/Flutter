import 'package:fashionapp_ui/check_out.dart';
import 'package:fashionapp_ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Map<String, dynamic>> info = [
    {
      "image": "lib/Images/h1.png",
      "name": "Premium Tagerine Shirt",
      "color": "Yellow Size 8",
      "price": "\$257.85",
      "size": "1x",
    },
    {
      "image": "lib/Images/s2_3.png",
      "name": "Leather Tagerine Coart",
      "color": "Yellow Size 8",
      "price": "\$257.85",
      "size": "1x",
    },
  ];

  List<Map<String, dynamic>> bill = [
    {"Name": "Total Items (3)", "price": "\$116.00"},
    {"Name": "Standard Delivery", "price": "\$12.00"},
    {"Name": "Total Payment", "price": "\$126.00"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, right: 5, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // const SizedBox(
                //   width: 20,
                // ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const Home();
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
                  "Cart",
                  style: GoogleFonts.imprima(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(13, 13, 14, 1),
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "My Orders",
              style: GoogleFonts.imprima(
                fontSize: 36,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
                // padding: EdgeInsets.only(bottom: 90),
                shrinkWrap: true,
                itemCount: info.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    closeOnScroll: true,
                    endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        extentRatio: 0.3,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 100),
                            child: Container(
                              height: 50,
                              width: 115,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(255, 122, 0, 1),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20))),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.delete_outline_outlined,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 160,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                                image: DecorationImage(
                                  image: AssetImage(info[index]['image']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 150,
                                  child: Text(
                                    info[index]['name'],
                                    style: GoogleFonts.imprima(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(
                                            13, 13, 14, 1)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 60,
                                  child: Text(
                                    info[index]['color'],
                                    style: GoogleFonts.imprima(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 107, 106, 110)),
                                  ),
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: 150,
                                      child: Text(
                                        info[index]['price'],
                                        style: GoogleFonts.imprima(
                                            fontSize: 26,
                                            fontWeight: FontWeight.w600,
                                            color: const Color.fromRGBO(
                                                13, 13, 14, 1)),
                                      ),
                                    ),
                                    // const Spacer(),
                                    const SizedBox(
                                      width: 80,
                                    ),
                                    SizedBox(
                                      height: 50,
                                      // width: 150,
                                      child: Text(
                                        info[index]['size'].substring(0, 1),
                                        style: GoogleFonts.imprima(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w600,
                                            color: const Color.fromRGBO(
                                                13, 13, 14, 1)),
                                      ),
                                    ),
                                    Text(
                                      info[index]['size'].substring(1, 2),
                                      style: GoogleFonts.imprima(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromRGBO(
                                              13, 13, 14, 1)),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  );
                }),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: 380,
              color: const Color.fromARGB(255, 138, 134, 147),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              // padding: EdgeInsets.all(10),
              shrinkWrap: true,
              itemCount: bill.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          bill[index]['Name'],
                          style: GoogleFonts.imprima(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromARGB(255, 89, 88, 92)),
                        ),
                        const Spacer(),
                        Text(
                          bill[index]['price'],
                          style: GoogleFonts.imprima(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 89, 88, 92)),
                        ),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            //---------------------------------------------

            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Checkout();
                    },
                  ));
                },
                child: Container(
                  height: 60,
                  width: 190,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(40),
                    color: const Color.fromRGBO(255, 122, 0, 1),
                  ),
                  child: Text(
                    "Checkout Now",
                    style: GoogleFonts.imprima(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
