import 'package:flutter/material.dart';
import 'package:musicapp/view/Screen1.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class Playlist extends ChangeNotifier {
  List<Map<String, dynamic>> getdata = [
    {
      "id": 1,
      "image": "lib/Images/pk1.png",
      "Name": "Dead inside",
      "Year": "2020",
      "Music": "Audio/lotus-sky-dreams-216049.mp3",
      "sName": "Vintage Vibes",
      "islike": false
    },
    {
      "id": 2,
      "image": "lib/Images/s2_2.jpg",
      "Name": "Alone ",
      "Year": "2023",
      "Music": "Audio/corporate-climb-200939.mp3",
      "sName": "Lasy Sounday",
      "islike": false
    },
    {
      "id": 3,
      "image": "lib/Images/s2_3.jpg",
      "Name": "Heartless ",
      "Year": "2023",
      "Music": "Audio/dance-mood-132148.mp3",
      "sName": "Cafe Ambience",
      "islike": false
    },
    {
      "id": 4,
      "image": "lib/Images/pk2.png",
      "Name": "Dead inside",
      "Year": "2020",
      "Music": "Audio/happy-114950.mp3",
      "sName": "Indie Dreams",
      "islike": false
    },
    {
      "id": 5,
      "image": "lib/Images/pk4.png",
      "Name": "Alone ",
      "Year": "2023",
      "Music": "Audio/happy-210888.mp3",
      "sName": "Wenter Blues",
      "islike": false
    },
    {
      "id": 6,
      "image": "lib/Images/pk5.png",
      "Name": "Heartless ",
      "Year": "2023",
      "Music": "Audio/joyride-jamboree-206911.mp3",
      "sName": "Lofi Music",
      "islike": false
    },
    {
      "id": 7,
      "image": "lib/Images/k5.jpg",
      "Name": "Heartless ",
      "Year": "2023",
      "Music":
          "Audio/xmas-background-short-music-for-video-vlog-deck-the-halls-42-second-181855.mp3",
      "sName": "Relax Music",
      "islike": false
    },
    {
      "id": 8,
      "image": "lib/Images/k4.jpg",
      "Name": "Heartless ",
      "Year": "2023",
      "Music": "Audio/whistle-joyride-193123.mp3",
      "sName": "Child mix",
      "islike": false
    },
    {
      "id": 9,
      "image": "lib/Images/s2_2.jpg",
      "Name": "Alone ",
      "Year": "2023",
      "Music": "Audio/corporate-climb-200939.mp3",
      "sName": "Study Lofi",
      "islike": false
    },
    {
      "id": 10,
      "image": "lib/Images/s2_3.jpg",
      "Name": "Heartless ",
      "Year": "2023",
      "Music": "Audio/dance-mood-132148.mp3",
      "sName": "Hip Hop Mix",
      "islike": false
    },
    {
      "id": 11,
      "image": "lib/Images/k3.jpg",
      "Name": "Dead inside",
      "Year": "2020",
      "Music": "Audio/happy-114950.mp3",
      "sName": "Dark Lofi Night",
      "islike": false
    },
    {
      "id": 12,
      "image": "lib/Images/k2.jpg",
      "Name": "Alone ",
      "Year": "2023",
      "Music": "Audio/reflected-light-147979.mp3",
      "sName": "Love Song",
      "islike": false
    },
    {
      "id": 13,
      "image": "lib/Images/k1.jpg",
      "Name": "Heartless ",
      "Year": "2023",
      "Music": "Audio/joyride-jamboree-206911.mp3",
      "sName": "Remix Song",
      "islike": false
    },
  ];
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
