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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //player.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
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
                      "Med... 📝",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0),
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
                          "assets/images/14.jpg",
                        ),
                      ),
                    ),
                    const SizedBox(height: 100.0),
                    // First Paragraph
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      alignment: Alignment.center,
                      child: const Text(
                        "Since you are an arc student I figured why not try to speak ur language. \n",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    // Arc Memes
                    // ArcMeme #1
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      alignment: Alignment.center,
                      child: const Text(
                        "Since you are an arc student I figured why not try to speak ur language.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "viewImagesPage",
                          arguments: {
                            "networkImage": "assets/images/arcMeme1.jpg",
                            "scaffoldBG": "Colors.greenAccent",
                            "isAsset": true,
                          },
                        );
                      },
                      child: Image.asset("assets/images/arcMeme1.jpg"),
                    ),
                    // ArcMeme #2
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      alignment: Alignment.center,
                      child: const Text(
                        "Since you are an arc student I figured why not try to speak ur language.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "viewImagesPage",
                          arguments: {
                            "networkImage": "assets/images/arcMeme2.jpg",
                            "scaffoldBG": "Colors.greenAccent",
                            "isAsset": true,
                          },
                        );
                      },
                      child: Image.asset("assets/images/arcMeme2.jpg"),
                    ),
                    // ArcMeme #3
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      alignment: Alignment.center,
                      child: const Text(
                        "Since you are an arc student I figured why not try to speak ur language.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "viewImagesPage",
                          arguments: {
                            "networkImage": "assets/images/arcMeme3.jpg",
                            "scaffoldBG": "Colors.greenAccent",
                            "isAsset": true,
                          },
                        );
                      },
                      child: Image.asset("assets/images/arcMeme3.jpg"),
                    ),
                    // ArcMeme #4
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      alignment: Alignment.center,
                      child: const Text(
                        "Since you are an arc student I figured why not try to speak ur language.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "viewImagesPage",
                          arguments: {
                            "networkImage": "assets/images/arcMeme4.jpg",
                            "scaffoldBG": "Colors.greenAccent",
                            "isAsset": true,
                          },
                        );
                      },
                      child: Image.asset("assets/images/arcMeme4.jpg"),
                    ),
                    // ArcMeme #5
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      alignment: Alignment.center,
                      child: const Text(
                        "Since you are an arc student I figured why not try to speak ur language.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "viewImagesPage",
                          arguments: {
                            "networkImage": "assets/images/arcMeme5.jpg",
                            "scaffoldBG": "Colors.greenAccent",
                            "isAsset": true,
                          },
                        );
                      },
                      child: Image.asset("assets/images/arcMeme5.jpg"),
                    ),
                    const SizedBox(height: 100.0),
                    // Continue Button
                    ElevatedButton(
                      onPressed: () {
                        //player.pause();
                        Navigator.pushNamed(context, "page4");
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
