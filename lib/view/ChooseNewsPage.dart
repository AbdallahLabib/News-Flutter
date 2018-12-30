import 'package:flutter/material.dart';

class ChooseNewsPage extends StatefulWidget {
  @override
  _ChooseNewsPageState createState() => _ChooseNewsPageState();
}

class _ChooseNewsPageState extends State<ChooseNewsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("ChooseNewsPage"),
        centerTitle: true,
      ),
      body: new Center(
        child: Text("ChooseNewsPage"),
      ),
    );
    ;
  }
}
