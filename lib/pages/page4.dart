import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
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
          children: const [
            SizedBox(height: 100.0),
            Text(
              "HI",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              "HI",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
