import 'dart:math';

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
    List songs = [
      "assets/music/ChasingCars.mp3",
      "assets/music/Dandelions.mp3",
      "assets/music/ItsYou.mp3",
      "assets/music/LDRSong.mp3",
    ];
    Random random = Random();
    String song = songs[random.nextInt(songs.length - 1)];
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
                      "Hey Babe... 📝",
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
                          "assets/images/removeBG33.jpg", // Pic102
                        ),
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      alignment: Alignment.center,
                      child: const Text(
                        "This offline version is for the days you don't have internet connection and/or when you just want a permanent unchanging part of my word right as we are starting our relationship! ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      alignment: Alignment.center,
                      child: const Text(
                        "You are so wonderful and beautiful in everything that you are and do. I've never thought I'd be this lucky and blessed to have you around. You are just so perfect to me babe. 👌 \n\n We have a story worth telling whether we make it or not! And as a start I just wanna say I freaking love you with all my heart! You've put this comforting emotion in me eversince I saw you back in 7th Grade! Every text and voice message, every online status I get from you just melts me in every way imaginable! ❣ \n\n Babe, we've had our ups and downs, and I've had days when I wish I knew how to quit you, but those days are long gone. But now, now babe, now you are the love of my life. My happy thought in the morning.  Every atom of your body is as dear to me as my own, in pain and sickness it would still be lovely to me! 😍 \n\n Then there's our first kiss on December the 30th. I've heard of a quote that says 'Soul meets soul on lovers' lips' but it wasn't until i've kissed you that I knew what it meant. Now, that my soul has touched yours, there isn't any other things that excites me as much. In that mere 3-5 seconds of kiss, I saw the most beautiful life flash before my eyes. I didn't just see two teens in college kissing hidden in a small apartment in addis, I saw two grown adults, one beautiful woman, one incredible man sealing a promise to forever be together. I saw a heart warming wedding, I saw a beautiful mother, I saw a happy family and so much more incredibleness for what felt like time pausing for infinity in those 3-5 seconds. I freaking love you! 😘 \n\n I'm so in love with you, I've said it a million times by now, but it's cause I feel it a billion more. I wanna marry you!! And I dont't mary someone I can live with, I marry someone I can't live without and that's all you med! Godd, Baby, if I get to time travel, I'd find you sooner so I could love you longer ewnet! And I don't ever want you hurting, from this day forward you won't walk alone, my heart will be your shelter and my arms your home! Finally, this scripture in the bible is from me to you, 'I have found the one whom my soul loves.' (Songs of Solomon 3:4) You are the lover of my soul! ♥ \n\n\n Here's a toast to us... \n I love you for this life and the life beyond.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      alignment: Alignment.center,
                      child: const Text(
                        "💘 🎉 🥂 ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 80.0),
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
