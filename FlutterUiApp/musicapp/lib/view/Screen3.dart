import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/view/Screen4.dart';
import 'package:musicapp/view/bottomClass.dart';
import 'package:musicapp/view/main.dart';
import 'package:provider/provider.dart';

import 'Screen2.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

// lib/Images/s2_2.jpg
class _Screen3State extends State<Screen3> {
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    _audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {});
    });

    _audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    _audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    super.initState();
  }

  String formatString(int second1) {
    return '${Duration(seconds: second1)}'.split('.')[0].padLeft(8, '0');
  }

  bool flag1 = false;
  bool flag2 = false;

  final _audioPlayer = AudioPlayer();

  Future<void> playSong(String path) async {
    flag1 = true;
    log(path);
    await _audioPlayer.play(AssetSource(path));
    setState(() {});
  }

  Future<void> pauseSong() async {
    flag1 = false;

    await _audioPlayer.pause();
    setState(() {});
  }

  Future<void> songVal(double val) async {
    await _audioPlayer.setVolume(val);
    setState(() {});
  }

  @override
  void dispose() {
    log("go it");
    // _audioPlayer.stop();
    _audioPlayer.dispose();
    setState(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 561,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      Provider.of<Playlist>(context, listen: false)
                          .getdata[indexs]['image']),
                  fit: BoxFit.fill),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(
                    //   builder: (context) {
                    //     return const Screen2();
                    //   },
                    // ));
                    Navigator.pop(context);
                  },
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                        color: Color.fromRGBO(230, 154, 21, 1),
                      ),
                      Text(
                        "Back",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(230, 154, 21, 1),
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Center(
                  child: Text(
                    "Alone in the Abyss",
                    style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(230, 154, 21, 1)),
                  ),
                ),
                Center(
                  child: Text(
                    "Youlakou",
                    style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    (Provider.of<Playlist>(context, listen: false)
                                .getdata[indexs]['islike'] ==
                            true)
                        ? GestureDetector(
                            onTap: () {
                              Provider.of<Playlist>(context, listen: false)
                                  .getdata[indexs]['islike'] = false;
                              setState(() {});
                              log("${Provider.of<Playlist>(context, listen: false).getdata[indexs]['islike']}");
                            },
                            child: const Icon(
                              Icons.favorite,
                              size: 32,
                              color: Color.fromRGBO(230, 154, 21, 1),
                            ),
                          )
                        : GestureDetector(
                            onTap: () async {
                              Provider.of<Playlist>(context, listen: false)
                                  .getdata[indexs]['islike'] = true;
                              setState(() {});
                              log("${Provider.of<Playlist>(context, listen: false).getdata[indexs]['islike']}");
                            },
                            child: const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const Screen4();
                            },
                          ));
                        },
                        child:
                            Image.asset("lib/Images/radix-icons_share-2.png")),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            height: 248.4,
            width: double.infinity,
            decoration:
                const BoxDecoration(color: Color.fromRGBO(19, 19, 19, 1)),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Dynamic Warmup | ",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(255, 255, 255, 1)),
                    ),
                    const Spacer(),
                    Text(
                      "4min",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(255, 255, 255, 1)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 6,
                  width: 430,
                  child: Slider(
                      min: 0,
                      max: duration.inSeconds.toDouble(),
                      value: position.inSeconds.toDouble(),
                      activeColor: const Color.fromRGBO(230, 154, 21, 1),
                      onChanged: (value) {
                        log("${value.toInt()}");
                        final position = Duration(seconds: value.toInt());
                        _audioPlayer.seek(position);
                        _audioPlayer.resume();
                        setState(() {});
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        formatString(duration.inSeconds),
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(255, 255, 255, 1)),
                      ),
                      const Spacer(),
                      Text(
                        formatString((duration - position).inSeconds),
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(255, 255, 255, 1)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () async {
                        await _audioPlayer.seek(Duration.zero);
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.loop_rounded,
                        size: 25,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () async {
                        if (indexs == 0) {
                          indexs = Provider.of<Playlist>(context, listen: false)
                                  .getdata
                                  .length -
                              1;
                        } else {
                          indexs--;
                        }
                        await pauseSong();
                        String Path =
                            Provider.of<Playlist>(context, listen: false)
                                .getdata[indexs]['Music'];
                        await Future<void>.delayed(Duration(seconds: 1));
                        await playSong(Path);
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.skip_previous,
                        size: 35,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () async {
                        if (!flag1) {
                          String path =
                              Provider.of<Playlist>(context, listen: false)
                                  .getdata[indexs]['Music'];
                          await playSong(path);
                        } else {
                          flag1 = false;
                          await pauseSong();
                        }

                        setState(() {});
                      },
                      icon: (!flag1)
                          ? const Icon(Icons.play_circle_fill_outlined,
                              size: 75, color: Color.fromRGBO(255, 255, 255, 1))
                          : const Icon(Icons.pause_circle_filled_outlined,
                              size: 75,
                              color: Color.fromRGBO(255, 255, 255, 1)),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () async {
                        if (indexs <
                            Provider.of<Playlist>(context, listen: false)
                                    .getdata
                                    .length -
                                1) {
                          indexs++;
                        } else {
                          indexs = 0;
                        }
                        await pauseSong();
                        String Path =
                            Provider.of<Playlist>(context, listen: false)
                                .getdata[indexs]['Music'];
                        await Future<void>.delayed(Duration(seconds: 1));
                        await playSong(Path);
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.skip_next,
                        size: 35,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () async {
                        flag2 = !flag2;
                        if (!flag2) {
                          await songVal(1);
                        } else {
                          await songVal(0);
                        }
                        setState(() {});
                      },
                      child: Icon(
                        (!flag2) ? Icons.volume_up : Icons.volume_off_rounded,
                        size: 25,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                    const Spacer(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomClass(),
    );
  }
}
