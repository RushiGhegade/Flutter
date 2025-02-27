import 'dart:developer';

import 'package:courceapp/view/show_lecture.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VedioStart extends StatefulWidget {
  String image;
  String name;

  VedioStart({super.key, required this.image, required this.name});

  @override
  State<VedioStart> createState() => _VedioStartState();
}

class _VedioStartState extends State<VedioStart> {
  late VideoPlayerController _controller;

  int startTime = 0;

  bool _isVisible = true;

  Widget LectureContent() {
    return Column(
      children: [
        Expanded(
          child: Center(child: Text("No Notes Available")),
        )
      ],
    );
  }

  Widget Live() {
    return Center(child: Text("No Live Resource Available"));
  }

  Widget QuestionAnswer() {
    return Center(child: Text("No Questions Available"));
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  Widget startVedio(var isLandscape) {
    _controller.position.then((position) {
      if (position != null) {
        log(formatDuration(position));
      }
    });

    return _controller.value.isInitialized
        ? Stack(children: [
            Container(
              color: Colors.black,
              width: double.infinity,
              height: isLandscape ? MediaQuery.of(context).size.height : 250,
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ),
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              curve: Curves.bounceOut,
              child: Center(
                child: (_controller.value.isPlaying)
                    ? GestureDetector(
                        onTap: () {
                          changePlay();
                        },
                        child: Icon(
                          Icons.pause,
                          color: Colors.white,
                          size: 80,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          changePlay();
                        },
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 80,
                        ),
                      ),
              ),
            )
          ])
        : Center(child: CircularProgressIndicator());
  }

  void _startTimer() {
    Future.delayed(Duration(seconds: 6), () {
      setState(() {
        _isVisible = false;
      });
    });
  }

  void _showWidgetAgain() {
    setState(() {
      _isVisible = true;
    });
    _startTimer();
  }

  double _progress = 0.0; // Progress value for the slider
  bool _isDragging = false; // To track if user is dragging slider

  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.image))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
          log(widget.image);
          _startTimer();
          log("vedio intialize sucessfully");
          // flag = false;
        });
      })
      ..addListener(() {
        if (!_isDragging) {
          // Update only if not dragging
          setState(() {
            _progress = _controller.value.position.inMilliseconds.toDouble();
          });
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _changePlaybackSpeed(double speed) {
    setState(() {
      _playbackSpeed = speed;
      _controller.setPlaybackSpeed(speed);
    });
  }

  double _playbackSpeed = 1.0;

  void changePlay() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }

  void _onSeekStart() {
    setState(() {
      _isDragging = true;
    });
  }

  void _onSeekUpdate(double value) {
    setState(() {
      _progress = value;
    });
  }

  void _onSeekEnd(double value) {
    setState(() {
      _isDragging = false;
      _controller.seekTo(Duration(milliseconds: value.toInt()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    log("---------------------------------------------------------------------- $isLandscape");
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: (isLandscape)
              ? MediaQuery.of(context).size.height + 132
              : MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                GestureDetector(
                  onTap: () {
                    _showWidgetAgain();
                  },
                  child: Container(
                    height:
                        isLandscape ? MediaQuery.of(context).size.height : 250,
                    color: Colors.black,
                    width: MediaQuery.of(context).size.width,
                    child: startVedio(isLandscape),
                  ),
                ),
                Positioned(
                  top: 30,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return ShowLecture();
                        },
                      ));
                    },
                    child: Container(
                      height: 40,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ),
                Positioned(
                  top: (isLandscape)
                      ? MediaQuery.of(context).size.height - 50
                      : 222, //205
                  // left: 20,
                  child: AnimatedOpacity(
                    opacity: _isVisible ? 1.0 : 0.0,
                    duration: Duration(microseconds: 500),
                    child: _isVisible
                        ? Container(
                            height: 30,
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width,
                            // color: Colors.black,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                ValueListenableBuilder(
                                  valueListenable: _controller,
                                  builder:
                                      (context, VideoPlayerValue value, child) {
                                    final position = value.position;
                                    final duration = value.duration;
                                    final remaining = duration - position;
                                    final progress = position.inMilliseconds /
                                        (duration.inMilliseconds == 0
                                            ? 1
                                            : duration.inMilliseconds);
                                    final progressPercent =
                                        (progress * 100).toStringAsFixed(1);
                                    log("----------$progressPercent");

                                    return Row(
                                      children: [
                                        Text(
                                          "${formatDuration(position)}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        SizedBox(
                                          height: 7,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              220,
                                          child: Slider(
                                            min: 0,
                                            max: _controller
                                                .value.duration.inMilliseconds
                                                .toDouble(),
                                            value: _progress,
                                            onChangeStart: (value) =>
                                                _onSeekStart(),
                                            onChanged: (value) =>
                                                _onSeekUpdate(value),
                                            onChangeEnd: (value) =>
                                                _onSeekEnd(value),
                                            activeColor: Colors.red,
                                            inactiveColor: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          "- ${formatDuration(remaining)}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        PopupMenuButton<double>(
                                          icon: Icon(
                                            Icons.speed_outlined,
                                            color: Colors.black,
                                            // size: 21,
                                          ),
                                          onSelected: _changePlaybackSpeed,
                                          itemBuilder: (context) {
                                            return [0.5, 1.0, 1.5, 2.0]
                                                .map(
                                                  (speed) =>
                                                      PopupMenuItem<double>(
                                                    value: speed,
                                                    child: Text("${speed}x"),
                                                  ),
                                                )
                                                .toList();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
                        : SizedBox.shrink(),
                  ),
                ),
              ]),

              (!isLandscape)
                  ? Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.name,
                                style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Lecture 1",
                                style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Container(),
              (!isLandscape)
                  ? Container(
                      // color: Colors.white, // Background color for the TabBar
                      child: TabBar(
                        tabs: [
                          Tab(text: 'Notes (0)'),
                          Tab(text: 'Live (0)'),
                          Tab(text: 'Q&A (0)'),
                        ],
                        indicatorColor:
                            Colors.orange, // Color of the active tab indicator
                        labelColor: Colors.orange, // Active tab text color
                        unselectedLabelColor:
                            Colors.black, // Inactive tab text color
                      ),
                    )
                  : Container(),
              // TabBarView Section
              (!isLandscape)
                  ? Expanded(
                      child: TabBarView(
                        children: [
                          LectureContent(),
                          Live(),
                          QuestionAnswer(),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
