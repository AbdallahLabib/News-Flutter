import 'package:flutter/material.dart';

import 'view/Splashscreen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Futter',
      home: SplashScreen(),
      theme: ThemeData.dark(),
    );
  }
}
