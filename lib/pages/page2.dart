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

  void playPause() async {
    if (isRaining == true) {
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
            ? RacingLinesBehaviour(direction: LineDirection.Ttb, numLines: 300)
            : EmptyBehaviour(),
        child: Container(
          width: double.infinity,
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100.0),
              const Text(
                "🌧🌧🌧",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20.0),
              WidgetCircularAnimator(
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
              ),
              const SizedBox(height: 20.0),
              const SizedBox(height: 20.0),
              const SizedBox(
                width: 290.0,
                child: Text(
                  "I wish I could just soak in the rain with you! Just soaking wet together. \nI'll just turn to you and tell you how much I really rain you! ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  playPause();
                  isRaining = !isRaining;
                  setState(() {});
                  //Navigator.pushNamed(context, "page3");
                },
                child: Text(
                  isRaining == false ? "Make it rain!    🌧" : "Stop the rain!",
                  style: const TextStyle(
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
                    fixedSize: MaterialStateProperty.all(Size(170.0, 50.0))),
              ),
              const Spacer(),
              ElevatedButton(
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
                    fixedSize: MaterialStateProperty.all(Size(250.0, 50.0))),
              ),
              const SizedBox(height: 50.0)
            ],
          ),
        ),
      ),
    );
  }
}
