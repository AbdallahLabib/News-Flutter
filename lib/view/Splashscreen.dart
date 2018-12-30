import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/view/ChooseNewsPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //----------- Method to change activity -----------//
  _goToNextPage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => ChooseNewsPage()));
  }

  //----------- Make timer to wait 4 second after moving to next page -----------//
  void startTimer() {
    Duration timerSecond = Duration(seconds: 4);
    Timer(timerSecond, _goToNextPage);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // start Method here when this page initialize
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: Image.asset("assets/logo.png"),
      ),
    );
  }
}
