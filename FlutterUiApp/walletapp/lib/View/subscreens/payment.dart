import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletapp/View/subscreens/Paybills.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({super.key, required this.map});

  final Map<String, dynamic> map;

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      // border: Border.all(
                      //     color: const Color.fromRGBO(29, 98, 202, 1)),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "lib/Assets/Images/Illustration.png"))),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Payment done!",
                style: GoogleFonts.sora(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(25, 25, 25, 1),
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Center(
              child: SizedBox(
                height: 50,
                width: 180,
                child: Text(
                  textAlign: TextAlign.center,
                  "Bill payment has been done successfully",
                  style: GoogleFonts.sora(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(83, 93, 102, 1),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              textAlign: TextAlign.center,
              "Payment details",
              style: GoogleFonts.sora(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(25, 25, 25, 1),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(color: const Color.fromARGB(255, 167, 157, 156)),
                // color: const Color.fromARGB(72, 209, 166, 166)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Biller",
                      style: TextStyle(
                          color: Color.fromRGBO(120, 131, 141, 1),
                          fontSize: 15),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.map['com'],
                      style: const TextStyle(
                          color: Color.fromRGBO(33, 34, 36, 0.889),
                          fontSize: 15,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(color: const Color.fromARGB(255, 167, 157, 156)),
                // color: const Color.fromARGB(72, 209, 166, 166)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Amout",
                      style: TextStyle(
                          color: Color.fromRGBO(120, 131, 141, 1),
                          fontSize: 15),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      widget.map['price'],
                      style: const TextStyle(
                          color: Color.fromRGBO(33, 34, 36, 0.889),
                          fontSize: 15,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(color: const Color.fromARGB(255, 167, 157, 156)),
                // color: const Color.fromARGB(72, 209, 166, 166)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Transaction no.",
                          style: TextStyle(
                              color: Color.fromRGBO(120, 131, 141, 1),
                              fontSize: 15),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          widget.map['rno'],
                          style: const TextStyle(
                              color: Color.fromRGBO(33, 34, 36, 0.889),
                              fontSize: 15,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.copy),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.flag,
                  color: Colors.red,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Report a problem",
                  style: TextStyle(
                      color: Color.fromRGBO(216, 8, 8, 1),
                      fontSize: 19,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const PayBills();
                  },
                ));
              },
              child: Container(
                alignment: Alignment.center,
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(87, 50, 191, 1),
                  border: Border.all(
                      color: const Color.fromARGB(255, 167, 157, 156)),
                  // color: const Color.fromARGB(72, 209, 166, 166)
                ),
                child: const Text(
                  "Back to wallet",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 19,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
