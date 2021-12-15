// ignore_for_file: file_names ,
// ignore_for_

import 'package:animated_background/animated_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

class OffLinePage extends StatefulWidget {
  const OffLinePage({Key? key}) : super(key: key);

  @override
  _OffLinePageState createState() => _OffLinePageState();
}

class _OffLinePageState extends State<OffLinePage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, //Color(0xffF0D4E0), //Colors.grey[300],
      //appBar: AppBar(),
      body: AnimatedBackground(
        vsync: this,
        behaviour: SpaceBehaviour(), //RacingLinesBehaviour(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Text(
                "Hey Dag, 👋",
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30.0),
              WidgetCircularAnimator(
                size: 280.0,
                //singleRing: true,
                innerColor: Color(0xffee7180),
                outerColor: Color(0xffFF7180),
                child: Container(
                  width: 250.0,
                  height: 250.0,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(150.0),
                    ),
                  ),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset("assets/images/12.jpg"),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              Text(
                "This is my way of reaching out to you and being with you everywhere you go.",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[300],
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "This is for the days you aren't with me. \nBut need my cuddles the most. \nI hope this makes you smile!",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[300],
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "page1");
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
              const SizedBox(height: 10.0),
              const Text(
                "Put your headphone's on. 🎧",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
