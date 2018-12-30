import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("News Page"),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Center(
          child: Text("News Page"),
        )));
  }
}
