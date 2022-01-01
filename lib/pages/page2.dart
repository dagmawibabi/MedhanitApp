import 'dart:async';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> with TickerProviderStateMixin {
  dynamic player;
  void musicPlayer() async {
    player = AudioPlayer();
    var duration = await player.setAsset("assets/music/RainSound.mp3");
    //player.play();
  }

  int rainDrops = 10;

  void increaseRain() {
    Timer.periodic(
      Duration(microseconds: 200),
      (value) {
        rainDrops += rainDrops;
        setState(() {});
      },
    );
  }

  void playPause() async {
    if (isRaining == false) {
      //increaseRain();
      musicPlayer();
      player.play();
    } else {
      player.pause();
    }
  }

  bool isRaining = false;
  @override
  void initState() {
    musicPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        vsync: this,
        behaviour: isRaining == true
            ? RacingLinesBehaviour(direction: LineDirection.Ttb, numLines: 500)
            : EmptyBehaviour(),
        child: Container(
          //width: double.infinity,
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100.0),
              Text(
                isRaining == false ? "🌧🌧🌧" : "",
                style: const TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20.0),
              isRaining == false
                  ? WidgetCircularAnimator(
                      size: 230.0,
                      //singleRing: true,
                      innerColor: Color(0xffee7180),
                      outerColor: Color(0xffFF7180),
                      child: Container(
                        width: 200.0,
                        height: 200.0,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100.0),
                          ),
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset("assets/images/12.jpg"),
                        ),
                      ),
                    )
                  : Container(),
              const SizedBox(height: 20.0),
              const SizedBox(height: 20.0),
              SizedBox(
                width: 290.0,
                child: Text(
                  isRaining == true
                      ? "I Rain You!"
                      : "I wish I could just soak in the rain with you! Just soaking wet together. \nI'll just turn to you and tell you how much I really rain you! ",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              isRaining == false
                  ? ElevatedButton(
                      onPressed: () {
                        playPause();
                        isRaining = !isRaining;
                        setState(() {});
                        //Navigator.pushNamed(context, "page3");
                      },
                      child: const Text(
                        "Make it rain!    🌧",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            //Color(0xffFF7180),
                            Colors.lightBlue,
                          ),
                          fixedSize:
                              MaterialStateProperty.all(Size(170.0, 50.0))),
                    )
                  : Container(),
              const Spacer(),
              isRaining == false
                  ? ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "page3");
                      },
                      child: const Text(
                        "Click here to the next page! ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color(0xffFF7180),
                          ),
                          fixedSize:
                              MaterialStateProperty.all(Size(250.0, 50.0))),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        playPause();
                        isRaining = !isRaining;
                        setState(() {});
                        //Navigator.pushNamed(context, "page3");
                      },
                      child: Text(
                        isRaining == false
                            ? "Make it rain!    🌧"
                            : "Stop the rain!",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: isRaining == false ? 17.0 : 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            //Color(0xffFF7180),
                            Colors.lightBlue,
                          ),
                          fixedSize: MaterialStateProperty.all(
                              isRaining == false
                                  ? Size(170.0, 50.0)
                                  : Size(150.0, 25.0))),
                    ),
              const SizedBox(height: 50.0)
            ],
          ),
        ),
      ),
    );
  }
}
