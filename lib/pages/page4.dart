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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //player.pause();
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
                    // Main Title
                    const Text(
                      "⏲ 🖼 ⏳ \n Ride along memory lane",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    // Circular Image
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
                    const SizedBox(height: 30.0),
                    // First Paragraph
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      alignment: Alignment.center,
                      child: const Text(
                        "Hey beautiful, how bout I try to melt you down huh? ... ☺ \n",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Hint
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      alignment: Alignment.center,
                      child: const Text(
                        "You can click on the images to open them",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    // Arc Memes
                    // ArcMeme #1
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "You are miles away but no one's closer to my heart than you! Loving you even tho I don't see you everyday is not a bad thing, it's just proof to the world that love is not in sight but in the heart! ♥",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "viewImagesPage",
                          arguments: {
                            "networkImage": "assets/images/collage2.jpg",
                            "scaffoldBG": "Colors.greenAccent",
                            "isAsset": true,
                          },
                        );
                      },
                      child: Image.asset("assets/images/collage2.jpg"),
                    ),
                    const SizedBox(height: 60.0),
                    // ArcMeme #2
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Yes I'm awkward, but what's even sweeter is that you've fallen in love with my awkwardness! And I for yours. I just can't wait for so many cringe and awkward moments in life with you. 😂",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "viewImagesPage",
                          arguments: {
                            "networkImage": "assets/images/collage1.jpg",
                            "scaffoldBG": "Colors.greenAccent",
                            "isAsset": true,
                          },
                        );
                      },
                      child: Image.asset("assets/images/collage1.jpg"),
                    ),
                    const SizedBox(height: 60.0),
                    // ArcMeme #3
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "I choose you today, I choose you tomorrow, and I'll choose you for forever. It's funny that I think 1 lifetime with you is just not enough. And that I pray that God unites us in the life after. I can't get enough of you. I crave you med. 😋",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "viewImagesPage",
                          arguments: {
                            "networkImage": "assets/images/collage3.jpg",
                            "scaffoldBG": "Colors.greenAccent",
                            "isAsset": true,
                          },
                        );
                      },
                      child: Image.asset("assets/images/collage3.jpg"),
                    ),
                    const SizedBox(height: 60.0),
                    // ArcMeme #4
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "I am nothing special, just a common man with common thoughts, and I’ve led a common life. There are no monuments dedicated to me and my name will soon be forgotten. But in one aspect of my life I have succeeded as gloriously as anyone who’s ever lived: I’ve loved you with all my heart and soul; and i'm lucky and blessed enough to be loved back by you. And even on the days you didn't, it was still enough for me! 💙",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "viewImagesPage",
                          arguments: {
                            "networkImage": "assets/images/collage8.jpg",
                            "scaffoldBG": "Colors.greenAccent",
                            "isAsset": true,
                          },
                        );
                      },
                      child: Image.asset("assets/images/collage8.jpg"),
                    ),
                    const SizedBox(height: 60.0),
                    // ArcMeme #5
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Babe, I may not be your first date, kiss or love. but I want to be your last everything. You are the one I want to die knowing I've loved and married. I could start a fire with what I feel for you babe! 🔥",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "viewImagesPage",
                          arguments: {
                            "networkImage": "assets/images/collage5.jpg",
                            "scaffoldBG": "Colors.greenAccent",
                            "isAsset": true,
                          },
                        );
                      },
                      child: Image.asset("assets/images/collage5.jpg"),
                    ),
                    const SizedBox(height: 60.0),
                    // ArcMeme #6
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "We've persevered throughout these years babe. Went from groing out to meet eachother with family and friends to travelling to different cities to get eachother. And that's so sweet. You are so much more worth the effort. My heart falls in love with you over and over again as if it never fell for anyone. I want you with me in a home we'll build together. But anywhere's home as long as you're there. You're home to me! 🏡",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "viewImagesPage",
                          arguments: {
                            "networkImage": "assets/images/collage7.jpg",
                            "scaffoldBG": "Colors.greenAccent",
                            "isAsset": true,
                          },
                        );
                      },
                      child: Image.asset("assets/images/collage7.jpg"),
                    ),
                    const SizedBox(height: 60.0),
                    // ArcMeme #7
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "These are the two hugs I just didn't want to let go off! First is my last goodbye before I moved to addis, and the second is our first hug afters years of not getting eachother! I wanted to stop time and hold you in my arms like that for forever! 🤗",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "viewImagesPage",
                          arguments: {
                            "networkImage": "assets/images/collage4.jpg",
                            "scaffoldBG": "Colors.greenAccent",
                            "isAsset": true,
                          },
                        );
                      },
                      child: Image.asset("assets/images/collage4.jpg"),
                    ),
                    const SizedBox(height: 40.0),
                    // Final text
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      alignment: Alignment.center,
                      child: const Text(
                        " I love you my med and I love you my Merissa.\nYou are the one for me!\n Live Forver!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      alignment: Alignment.center,
                      child: const Text(
                        "💝😍🥰😘💝",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 100.0),
                    // Continue Button
                    ElevatedButton(
                      onPressed: () {
                        //player.pause();
                        Navigator.pushNamed(context, "page2");
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
