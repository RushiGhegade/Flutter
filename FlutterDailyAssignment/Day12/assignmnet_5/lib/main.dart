// Create a TextField which when tapped a date picker must open and when
// you select the date it must be displayed in the TextField in the Format

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State createState() {
    return _MyAppState();
  }
}

TextEditingController date = TextEditingController();

class _MyAppState extends State {
  // const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: TextField(
              controller: date,
              readOnly: true,
              onTap: () async {
                DateTime? picdate = await showDatePicker(
                    context: context,
                    // initialDate: DateTime.now(),
                    firstDate: DateTime(2018),
                    lastDate: DateTime(2022));
                // print("Done");
                String dateformat = DateFormat("yyyy-MM-dd").format(picdate!);

                setState(() {
                  date.text = dateformat;
                });
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
            ),
          ),
        ),
      ),
    );
  }
}
