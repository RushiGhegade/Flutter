import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(width: 1),
            ),
            child: Image.network(
                "https://render.fineartamerica.com/images/rendered/medium/greeting-card/images/artworkimages/medium/3/valley-of-gods-john-mueller.jpg?&targetx=-19&targety=0&imagewidth=738&imageheight=500&modelwidth=700&modelheight=500&backgroundcolor=745444&orientation=0"),
          ),
        ),
      ),
    );
  }
}
