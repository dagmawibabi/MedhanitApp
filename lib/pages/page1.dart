import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  AudioPlayer player = AudioPlayer();
  void musicPlayer() async {
    player = AudioPlayer();
    var duration = await player.setAsset("assets/music/LDRSong.mp3");
    player.setLoopMode(LoopMode.one);
    player.play();
  }

  @override
  void initState() {
    musicPlayer();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    player.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent[400],
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100.0),
                    const Text(
                      "Med... 📝",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      width: 280.0,
                      height: 280.0,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(150.0),
                        ),
                        color: Colors.red,
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset(
                          "assets/images/100.jpg",
                        ),
                      ),
                    ),
                    const SizedBox(height: 100.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      alignment: Alignment.center,
                      child: const Text(
                        "Hey babe, adgiaugi adgagdia fai goafgag fogfiagf8oag a foagfagf lusag fadfaa fogfiagf8oag a foagfagf sdgilusag. \n\nHey babe, adgiaugi adgagdia fai goafgag fogfiagf8oag a foagfagf lusag fadfaa fogfiagf8oag a foagfagf sdgilusag. \n\n Hey babe, adgiaugi adgagdia fai goafgag fogfiagf8oag a foagfagf lusag fadfaa fogfiagf8oag a foagfagf sdgilusag. \n\n",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 100.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "page3");
                      },
                      child: const Text(
                        "Continue...",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color(0xffFF7180),
                          ),
                          fixedSize:
                              MaterialStateProperty.all(Size(200.0, 50.0))),
                    ),
                    const SizedBox(height: 100.0),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
