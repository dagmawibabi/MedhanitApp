import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  dynamic player;
  void musicPlayer() async {
    player = AudioPlayer();
    var duration = await player.setAsset("assets/music/Dandelions.mp3");
    player.play();
  }

  @override
  void initState() {
    //musicPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100.0),
            const Text(
              "HI",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const Text(
              "HI",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "page2");
              },
              child: const Text(
                "Click here to begin!",
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
                  fixedSize: MaterialStateProperty.all(Size(250.0, 50.0))),
            ),
          ],
        ),
      ),
    );
  }
}
