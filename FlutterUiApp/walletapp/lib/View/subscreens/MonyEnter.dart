import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'MapEnteryNext.dart';

class MonyEnter extends StatefulWidget {
  const MonyEnter({super.key, required this.map});

  final Map<String, dynamic> map;

  @override
  State<MonyEnter> createState() => _MonyEnterState();
}

class _MonyEnterState extends State<MonyEnter> {
  final TextEditingController _controller = TextEditingController();

  String _Amount = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "< Back",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(87, 50, 191, 1),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Transfer to",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(widget.map['Image']))),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.map['Name'],
                      style: GoogleFonts.poppins(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      widget.map['Phone'],
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(151, 0, 0, 0),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                "Enter Amount",
                style: GoogleFonts.poppins(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(120, 131, 141, 1),
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Center(
              child: SizedBox(
                width: 200,
                child: TextFormField(
                  controller: _controller,
                  onFieldSubmitted: (value) {
                    _Amount = value;
                    setState(() {});
                  },
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color.fromRGBO(87, 50, 191, 1),
                        ),
                      ),
                      // enabledBorder: OutlineInputBorder(

                      //     ),
                      hintText: "\$00.00",
                      hintStyle: TextStyle(
                        fontSize: 30,
                      )),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                widget.map['price'] = _Amount;
                log("${widget.map['price']}");
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return MonyEnterNext(map: widget.map);
                  },
                ));
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(87, 50, 191, 1)),
                child: Text(
                  "Done",
                  style: GoogleFonts.sora(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(255, 255, 255, 1)),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
