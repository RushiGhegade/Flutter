import 'package:fashionapp_ui/Cart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
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
                        return const Cart();
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
                  "Checkout",
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
              height: 30,
            ),
            const SizedBox(
                height: 80,
                width: 350,
                child: Image(
                    image: AssetImage("lib/Images/Address.png"),
                    fit: BoxFit.cover)),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const Icon(
                  Icons.replay_outlined,
                  color: Color.fromARGB(255, 90, 89, 93),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Delivered in next 7 days",
                  style: GoogleFonts.imprima(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(13, 13, 14, 1)),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
                height: 50,
                width: 350,
                child: Image(
                  image: AssetImage("lib/Images/Payment.png"),
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 60,
            ),
            Center(
              child: Text(
                "Add Voucher",
                style: GoogleFonts.imprima(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(255, 90, 89, 93)),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 60,
              // width: 310,
              child: Text(
                "Note : Use your order id at the payment. Your Id #154619 if you forget to put your order id we can’t confirm the payment.",
                style: GoogleFonts.imprima(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(121, 119, 128, 1)),
              ),
            ),
            const SizedBox(
              height: 30,
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
                              color: const Color.fromARGB(255, 89, 88, 92)),
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
              height: 40,
            ),
            Center(
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
                  "Pay Now",
                  style: GoogleFonts.imprima(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
