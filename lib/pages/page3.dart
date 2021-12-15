import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
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
