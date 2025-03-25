import 'package:flutter/material.dart';
import 'package:fluttertask/model/ModelClass.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowInformation extends StatefulWidget {
  final Modelclass selectMovie;

  const ShowInformation({required this.selectMovie, super.key});

  @override
  State<ShowInformation> createState() => _ShowInformationState();
}

class _ShowInformationState extends State<ShowInformation> {
  Widget showText(String type, String info) {
    return Row(
      children: [
        Text(
          "$type : ",
          style: GoogleFonts.montserrat(
            fontSize: MediaQuery.of(context).size.width * 0.056,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          (info.length < 18) ? info : info.substring(0, 16),
          style: GoogleFonts.montserrat(
            fontSize: MediaQuery.of(context).size.width * 0.056,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.selectMovie.poster,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.width*0.063,
                left: 10,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 35,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                showText("Movie name", widget.selectMovie.title),
                SizedBox(
                  height: 5,
                ),
                showText("Type", widget.selectMovie.type),
                SizedBox(
                  height: 5,
                ),
                showText("Release year", widget.selectMovie.year),
              ],
            ),
          )
        ],
      ),
    );
  }
}
