import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletapp/View/subscreens/endScreen.dart';

class MonyEnterNext extends StatefulWidget {
  const MonyEnterNext({super.key, required this.map});

  final Map<String, dynamic> map;

  @override
  State<MonyEnterNext> createState() => _MonyEnterNextState();
}

class _MonyEnterNextState extends State<MonyEnterNext> {
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
                  readOnly: true,
                  controller: _controller,
                  onFieldSubmitted: (value) {
                    _Amount = value;
                    setState(() {});
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color.fromRGBO(87, 50, 191, 1),
                        ),
                      ),
                      // enabledBorder: OutlineInputBorder(

                      //     ),
                      hintText: "\$${widget.map['price']}",
                      hintStyle: const TextStyle(
                        fontSize: 30,
                      )),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                // widget.map['']
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return EndScreen();
                  },
                ));
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(253, 194, 40, 1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.security,
                      color: Color.fromRGBO(39, 6, 133, 1),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Secure payment",
                      style: GoogleFonts.sora(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(39, 6, 133, 1)),
                    ),
                  ],
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
