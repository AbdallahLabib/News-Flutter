import 'package:flutter/material.dart';
import 'package:news_app/view/NewsPage.dart';

class ChooseNewsPage extends StatefulWidget {
  @override
  _ChooseNewsPageState createState() => _ChooseNewsPageState();
}

class _ChooseNewsPageState extends State<ChooseNewsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Flutter News"),
          centerTitle: true,
        ),
        body: GridView.count(
          mainAxisSpacing: 30,
          primary: false,
          padding: const EdgeInsets.all(20.0),
          crossAxisSpacing: 10.0,
          childAspectRatio: 1.2,
          crossAxisCount: 2,
          children: <Widget>[
            newsSection(
                icon: Icons.business,
                text: 'Business',
                context: context,
                typeContent: 'business'),
            newsSection(
              icon: Icons.favorite,
              text: 'Health',
              context: context,
              typeContent: 'health',
            ),
            newsSection(
              icon: Icons.code,
              text: 'Technology',
              context: context,
              typeContent: 'technology',
            ),
            newsSection(
              icon: Icons.ev_station,
              text: 'Science',
              context: context,
              typeContent: 'science',
            ),
            newsSection(
              icon: Icons.card_travel,
              text: 'Entertainment',
              context: context,
              typeContent: 'entertainment',
            ),
            newsSection(
              icon: Icons.score,
              text: 'Sports',
              context: context,
              typeContent: 'sports',
            ),
          ],
        ));
  }
}

Container newsSection({IconData icon, String text, context, typeContent}) {
  return Container(
    child: CircleAvatar(
      backgroundColor: Colors.blueGrey[700],
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NewsPage(
                  typeContent: typeContent,
                ))),
        child: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
              new Text(text,
                  style: TextStyle(
                    color: Colors.grey[50],
                  ))
            ],
          ),
        ),
      ),
    ),
  );
}
