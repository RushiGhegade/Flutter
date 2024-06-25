import 'package:flutter/material.dart';
import 'package:musicapp/view/Screen1.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class Playlist extends ChangeNotifier {
  // int index;

  // Playlist(this.index);

  // int takeindex()

  List<Map<String, dynamic>> getdata() {
    return [
      {
        "image": "lib/Images/pk1.png",
        "Name": "Dead inside",
        "Year": "2020",
        "Music": "Audio/lotus-sky-dreams-216049.mp3"
      },
      {
        "image": "lib/Images/s2_2.jpg",
        "Name": "Alone ",
        "Year": "2023",
        "Music": "Audio/corporate-climb-200939.mp3",
      },
      {
        "image": "lib/Images/s2_3.jpg",
        "Name": "Heartless ",
        "Year": "2023",
        "Music": "Audio/dance-mood-132148.mp3",
      },
      {
        "image": "lib/Images/pk2.png",
        "Name": "Dead inside",
        "Year": "2020",
        "Music": "Audio/happy-114950.mp3",
      },
      {
        "image": "lib/Images/pk4.png",
        "Name": "Alone ",
        "Year": "2023",
        "Music": "Audio/happy-210888.mp3",
      },
      {
        "image": "lib/Images/pk5.png",
        "Name": "Heartless ",
        "Year": "2023",
        "Music": "Audio/joyride-jamboree-206911.mp3",
      },
      {
        "image": "lib/Images/k5.jpg",
        "Name": "Heartless ",
        "Year": "2023",
        "Music":
            "Audio/xmas-background-short-music-for-video-vlog-deck-the-halls-42-second-181855.mp3",
      },
      {
        "image": "lib/Images/k4.jpg",
        "Name": "Heartless ",
        "Year": "2023",
        "Music": "Audio/whistle-joyride-193123.mp3",
      },
      {
        "image": "lib/Images/s2_2.jpg",
        "Name": "Alone ",
        "Year": "2023",
        "Music": "Audio/corporate-climb-200939.mp3",
      },
      {
        "image": "lib/Images/s2_3.jpg",
        "Name": "Heartless ",
        "Year": "2023",
        "Music": "Audio/dance-mood-132148.mp3",
      },
      {
        "image": "lib/Images/k3.jpg",
        "Name": "Dead inside",
        "Year": "2020",
        "Music": "Audio/happy-114950.mp3",
      },
      {
        "image": "lib/Images/k2.jpg",
        "Name": "Alone ",
        "Year": "2023",
        "Music": "Audio/reflected-light-147979.mp3",
      },
      {
        "image": "lib/Images/k1.jpg",
        "Name": "Heartless ",
        "Year": "2023",
        "Music": "Audio/joyride-jamboree-206911.mp3",
      },
    ];
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return Playlist();
          },
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Screen1(),
      ),
    );
  }
}
