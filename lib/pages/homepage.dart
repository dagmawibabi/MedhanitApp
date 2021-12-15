import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:animated_background/animated_background.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as Urllauncher;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // Functions for main feed
  List mainFeed = [];
  void getFeed() async {
    var url =
        Uri.parse("https://medhanitapi.herokuapp.com/api/mainfeed/receive");
    var response = await http.get(url);
    mainFeed = jsonDecode(response.body);
    //setState(() {});
  }

  void checkforupdates() async {
    int curMainFeedLength = mainFeed.length;
    String curScaffoldBG = scaffoldBG;
    int curMoodColorX = curMoodColor;
    Timer.periodic(const Duration(seconds: 1), (e) {
      print("checking for updates");
      getFeed();
      getBackground();
      getMood();
      if (curMainFeedLength < mainFeed.length) {
        curMainFeedLength = mainFeed.length;
        setState(() {});
      }
      if (curScaffoldBG != scaffoldBG) {
        curScaffoldBG = scaffoldBG;
        setState(() {});
      }
      if (curMoodColorX != curMoodColor) {
        curMoodColorX = curMoodColor;
        setState(() {});
      }
    });
  }

  String scaffoldBG = "";
  bool isFetching = true;
  void getBackground() async {
    var url = Uri.parse(
        "https://medhanitapi.herokuapp.com/api/mainfeed/background/receive");
    var response = await http.get(url);
    var responseJSON = jsonDecode(response.body);
    scaffoldBG = responseJSON["link"];
    isFetching = false;
    setState(() {});
  }

  void launchSong(url) async {
    Urllauncher.launch(url);
  }

  // Functionn for mood
  bool isMoodFetching = true;
  int curMoodColor = 0;
  List curColorCode = [];
  String curColorTitle = "";
  void getMood() async {
    // Get Color
    var url = Uri.parse(
        "https://medhanitapi.herokuapp.com/api/moodfeed/receivecolor");
    var response = await http.get(url);
    var responseJSON = jsonDecode(response.body);
    curMoodColor = int.parse(responseJSON[0]);

    // Get Color Code
    var url2 = Uri.parse(
        "https://medhanitapi.herokuapp.com/api/moodfeed/receivecolorcode");
    var response2 = await http.get(url2);
    var responseJSON2 = jsonDecode(response2.body);
    curColorCode = responseJSON2;

    // Get Color Title
    var url3 = Uri.parse(
        "https://medhanitapi.herokuapp.com/api/moodfeed/receivecolortitle");
    var response3 = await http.get(url3);
    var responseJSON3 = jsonDecode(response3.body);
    curColorTitle = responseJSON3[0];

    isMoodFetching = false;
    setState(() {});
  }

  // list of pages
  int curPageIndex = 0;
  dynamic pages(pageIndex) {
    List pages = [
      mainfeed(context),
      moodfeed(context),
      Container(
        color: Colors.white,
        child: const Text(
          "hello",
        ),
      ),
    ];
    return pages[pageIndex];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMood();
    getBackground();
    getFeed();
    setState(() {});
    checkforupdates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages(curPageIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curPageIndex,
        enableFeedback: true,
        onTap: (index) {
          setState(() {
            curPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.color_lens_outlined,
            ),
            label: "Mood",
          ),
          /*BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_outlined,
            ),
            label: "Chat",
          ),*/
        ],
      ),
      /*floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.chat_outlined,
        ),
        onPressed: () {},
      ),*/
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

// MOOD FEED
  Container moodfeed(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isMoodFetching == false
              ? [
                  Color(curMoodColor),
                  Color(curMoodColor),
                  Color(curMoodColor),
                  Color(curMoodColor),
                  //Color(0xffaaffaa),
                ]
              : [
                  Colors.white,
                  Colors.black,
                ],
        ),
        color: isMoodFetching == false ? Color(curMoodColor) : Colors.grey[800],
      ),
      child: ListView(
        children: [
          SizedBox(height: (MediaQuery.of(context).size.height / 3.5)),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(25.0),
              ),
              color: Colors.black.withOpacity(0.7),
            ),
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: curColorCode.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      index == 0
                          ? Column(
                              children: [
                                Text(
                                  curColorTitle,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                              ],
                            )
                          : Container(),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            curColorCode[index]["color"].toString(),
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            " - ",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            curColorCode[index]["meaning"].toString(),
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

// MAIN FEED
  AnimatedBackground mainfeed(BuildContext context) {
    return AnimatedBackground(
      vsync: this,
      behaviour: isFetching == true ? SpaceBehaviour() : EmptyBehaviour(),
      child: Container(
        decoration: isFetching == false
            ? BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(scaffoldBG.toString(), scale: 1.0),
                  fit: BoxFit.cover,
                ),
              )
            : BoxDecoration(color: Colors.transparent),
        child: ListView(
          children: [
            // Headlines
            Container(
              height: MediaQuery.of(context).size.height + 200,
              padding: const EdgeInsets.only(bottom: 300),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: mainFeed.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        //width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25.0),
                          ),
                          color: Colors.black.withOpacity(0.7),
                        ),
                        padding: const EdgeInsets.all(20.0),
                        margin: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title
                            Text(
                              mainFeed[index]["title"],
                              style: TextStyle(
                                color: Colors.grey[300],
                                fontSize: 22.0,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 10.0),
                            // Body
                            Text(
                              mainFeed[index]["body"],
                              style: TextStyle(
                                color: Colors.grey[400],
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 10.0),
                            // Image
                            mainFeed[index]["image"] != 0
                                ? Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(25.0),
                                      ),
                                      color: Colors.blue.withOpacity(0.9),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          "viewImagesPage",
                                          arguments: {
                                            "networkImage": mainFeed[index]
                                                ["image"],
                                            "scaffoldBG": scaffoldBG,
                                          },
                                        );
                                      },
                                      child: Image.network(
                                        mainFeed[index]["image"],
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  )
                                : Container(),
                            const SizedBox(height: 10.0),
                            // Music
                            mainFeed[index]["music"] != 0
                                ? GestureDetector(
                                    onTap: () {
                                      launchSong(mainFeed[index]["music"]);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.blue,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(25.0),
                                        ),
                                        color: Colors.blue.withOpacity(0.8),
                                      ),
                                      padding: const EdgeInsets.only(
                                          left: 8.0,
                                          right: 16.0,
                                          top: 4.0,
                                          bottom: 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Icon(Icons.attach_file_outlined),
                                          Text("Open Attachment"),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      index + 1 == mainFeed.length
                          ? const SizedBox(height: 900.0)
                          : Container(),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 200.0),
          ],
        ),
      ),
    );
  }
}
