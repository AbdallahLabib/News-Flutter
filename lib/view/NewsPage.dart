import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:news_app/controller/getNews.dart';
import 'package:news_app/model/NewsResult.dart';

class NewsPage extends StatefulWidget {
  final String typeContent;

  NewsPage({this.typeContent = "techology"}) :assert(typeContent != null);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  GetNews _getNews = GetNews();

  //----------- Choose Content of news and return data  -----------//
  _switchType() {
    switch (widget.typeContent) {
      case 'business':
        return _getNews.getBusinessNews();
        break;
      case 'entertainment':
        return _getNews.getEntertainmentNews();
        break;
      case 'health':
        return _getNews.getHealthNews();
        break;
      case 'science':
        return _getNews.getScienceNews();
        break;
      case 'sports':
        return _getNews.getSportsNews();
        break;
      case 'technology':
        return _getNews.getTechnologyNews();
        break;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("News Of " + widget.typeContent.toUpperCase()),
          centerTitle: true,
        ),
        body: SafeArea(
          child: FutureBuilder(
              future: _switchType(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  NewsResult newsResult = snapshot.data;
                  return ListView.builder(
                      itemCount: newsResult.articles.length,
                      itemBuilder: (BuildContext context, int position) {
                        return CardViewNews(
                          title: newsResult.articles[position].title,
                          image: newsResult.articles[position].urlToImage,
                        );
                      });
                }
                return Center(child: CircularProgressIndicator());
              }),
        ));
  }
}

class CardViewNews extends StatefulWidget {
  final String image;
  final String title;

  const CardViewNews({Key key, this.image, this.title}) : super(key: key);

  @override
  _CardViewNewsState createState() => _CardViewNewsState();
}

class _CardViewNewsState extends State<CardViewNews> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 180,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Card(
          margin: EdgeInsets.all(10),
          elevation: 4,
          child: SafeArea(
              child: Row(
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  Container(
                      height: 180,
                      width: 140,
                      child: Image.network(
                        widget.image,
                        fit: BoxFit.fill,
                      )),
                  Expanded(
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                              padding: EdgeInsets.all(5), child: AutoSizeText(
                            widget.title,
                            textDirection: TextDirection.rtl,
                            presetFontSizes: [40.0, 20.0, 16.0],
                            maxLines: 2,
                          )))),
                ],
              )),
        ),
      ),
    );
  }
}
