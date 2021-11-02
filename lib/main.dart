import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medhanit/pages/homepage.dart';
import 'package:medhanit/pages/loginpage.dart';
import 'package:medhanit/pages/offlinePage.dart';
import 'package:medhanit/pages/onlineorofflinepage.dart';
import 'package:medhanit/pages/viewimagepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor:
            Colors.transparent, //Colors.grey[200], //Color(0xff6dd5ed), //
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        "onOrOfflinePage": (context) => OnOrOfflinePage(),
        "homePage": (context) => HomePage(),
        "viewImagesPage": (context) => ViewImagesPage(),
        "offlinePage": (context) => OffLinePage(),
      },
      theme: ThemeData(
        fontFamily: "Abel",
        scaffoldBackgroundColor: Colors.transparent, //Colors.grey[200],
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black
              .withOpacity(0.7), //Colors.grey[200], //const Color(0xff2193b0),
          elevation: 0.0,
          selectedItemColor: Colors.white, //const Color(0xff1488cc),
          selectedIconTheme: const IconThemeData(
            size: 28.0,
          ),
          unselectedItemColor: Colors.grey[400],
          unselectedIconTheme: const IconThemeData(
            size: 20.0,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.black.withOpacity(0.7),
          foregroundColor: Colors.grey[300],
          elevation: 0.0,
        ),
      ),
    );
  }
}
