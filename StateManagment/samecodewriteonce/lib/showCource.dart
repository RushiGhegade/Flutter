import 'package:flutter/material.dart';

class showCource1 extends StatefulWidget {
  int count = 0;
  String cource;

  showCource1({required this.cource});

  @override
  State createState() {
    return _showCourceState();
  }
}

class _showCourceState extends State<showCource1> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            widget.count++;
            setState(() {});
          },
          child: Container(
            alignment: Alignment.center,
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.pink,
            ),
            child: Text(widget.cource),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Text(
          "${widget.count}",
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
        )
      ],
    );
  }
}
