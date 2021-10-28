import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnOrOfflinePage extends StatefulWidget {
  const OnOrOfflinePage({Key? key}) : super(key: key);

  @override
  _OnOrOfflinePageState createState() => _OnOrOfflinePageState();
}

class _OnOrOfflinePageState extends State<OnOrOfflinePage> {
  TextEditingController password = TextEditingController();
  bool wrongPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        color: Colors.grey,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(25.0),
            ),
            color: Colors.black.withOpacity(0.7),
          ),
          height: 250.0,
          padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 40.0),
          child: Column(
            children: [
              //const SizedBox(height: 250.0),
              Text(
                "Choose Version",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 25.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "homePage");
                },
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(160.0, 35.0))),
                child: const Text(
                  "Online",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "onOrOfflinePage");
                },
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(160.0, 35.0))),
                child: const Text(
                  "Offline",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
