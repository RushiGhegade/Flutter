import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletapp/View/subscreens/payment.dart';

class PayBills extends StatefulWidget {
  const PayBills({super.key});

  @override
  State<PayBills> createState() => _PayBillsState();
}

class _PayBillsState extends State<PayBills> {
  List<Map<String, dynamic>> list = [
    {
      "Image": "lib/Assets/Images/Icon.png",
      "Name": "Electricity",
      "Date": "Due: \$132.32",
      "DueDate": "December 29, 2022 - 12:32 ",
      "rno": "23010412432431",
      "price": " \$132.32",
      "com": "Electricity company inc.",
    },
    {
      "Image": "lib/Assets/Images/Icon (12).png",
      "Date": "Due: \$32",
      "Name": "Water",
      "DueDate": "December 29, 2022 - 12:32 ",
      "rno": "23010412432431",
      "price": " \$32",
      "com": "water company inc.",
    },
    {
      "Image": "lib/Assets/Images/Icon (13).png",
      "Date": "All Paid",
      "Name": "Phone",
      "DueDate": "December 29, 2022 - 12:32 ",
      "rno": "23010412432431",
      "price": "300",
      "com": "Jio pvt.ltd",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "< Back",
                        style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(29, 98, 202, 1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Pay to",
              style: GoogleFonts.poppins(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(230, 221, 255, 1),
                  ),
                  child: const Icon(Icons.add),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "New biller",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(25, 25, 25, 1),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Text(
                  "----------------------------------------- ",
                  style: TextStyle(color: Color.fromRGBO(178, 179, 184, 1)),
                ),
                Text(
                  "Or",
                  style: TextStyle(color: Color.fromRGBO(78, 78, 80, 1)),
                ),
                Text(
                  " -----------------------------------------",
                  style: TextStyle(color: Color.fromRGBO(178, 179, 184, 1)),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search biller",
                  hintStyle: TextStyle(
                      height: 4.5, color: Color.fromRGBO(178, 179, 184, 1)),
                  prefixIcon: Icon(Icons.search,
                      color: Color.fromRGBO(178, 179, 184, 1)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(178, 179, 184, 1))),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Saved billers",
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(25, 25, 25, 1),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        ShowBottombar(index);
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(list[index]['Image']))),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                list[index]["Name"],
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromRGBO(25, 25, 25, 1),
                                ),
                              ),
                              Text(
                                list[index]["Date"],
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(25, 25, 25, 1),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromRGBO(83, 93, 102, 1),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void ShowBottombar(int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 15, top: 10),
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(list[index]['Image']))),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        list[index]['Name'],
                        style: GoogleFonts.poppins(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(25, 25, 25, 1),
                        ),
                      ),
                      Text(
                        "utility",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(120, 131, 141, 1),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      // info[0][day[index]][index1]["Price"],
                      "Done",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(29, 98, 202, 1),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(72, 209, 166, 166)),
                child: Text(
                  list[index]['Date'],
                  style: const TextStyle(color: Colors.red, fontSize: 20),
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
                  border: Border.all(
                      color: const Color.fromARGB(255, 167, 157, 156)),
                  // color: const Color.fromARGB(72, 209, 166, 166)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Due Date",
                        style: TextStyle(
                            color: Color.fromRGBO(145, 162, 178, 1),
                            fontSize: 15),
                      ),
                      Text(
                        list[index]['DueDate'],
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
                  border: Border.all(
                      color: const Color.fromARGB(255, 167, 157, 156)),
                  // color: const Color.fromARGB(72, 209, 166, 166)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Transaction no.",
                        style: TextStyle(
                            color: Color.fromRGBO(120, 131, 141, 1),
                            fontSize: 15),
                      ),
                      Text(
                        list[index]['rno'],
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
              GestureDetector(
                onTap: () {
                  Map<String, dynamic> map1 = list[index];

                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return PaymentSuccess(map: map1);
                    },
                  ));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(253, 194, 40, 1),
                    border: Border.all(
                        color: const Color.fromARGB(255, 167, 157, 156)),
                    // color: const Color.fromARGB(72, 209, 166, 166)
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.security_rounded,
                        color: Color.fromRGBO(25, 25, 25, 1),
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Secure payment",
                        style: TextStyle(
                            color: Color.fromRGBO(25, 25, 25, 1),
                            fontSize: 19,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
