import 'package:flutter/material.dart';
import 'package:news_app/controller/getNews.dart';
import 'package:news_app/model/NewsResult.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:url_launcher/url_launcher.dart';
class NewsPage extends StatefulWidget {
  final String typeContent;

  NewsPage({this.typeContent = "technology"}) :assert(typeContent != null);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  GetNews _getNews = GetNews();

  //----------- Choose Content of news and return data  -----------//
  _fetchNews() {
   return _getNews.getNewsByType(widget.typeContent);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("News Of " + widget.typeContent),
          centerTitle: true,
        ),
        body: SafeArea(
          child: FutureBuilder(
              future: _fetchNews(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  NewsResult newsResult = snapshot.data;
                  return ListView.builder(
                      itemCount: newsResult.articles.length,
                      itemBuilder: (BuildContext context, int position) {
                        return CardViewNews(
                          title: newsResult.articles[position].title == null ? '' : newsResult.articles[position].title,
                          image: newsResult.articles[position].urlToImage== null ? 'https://safetyaustraliagroup.com.au/wp-content/uploads/2019/05/image-not-found.png' : newsResult.articles[position].urlToImage,
                          url: newsResult.articles[position].url == null ? 'www.google.com' : newsResult.articles[position].url,
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
  final String url;
  const CardViewNews({Key key, this.image, this.title,this.url}) : super(key: key);

  @override
  _CardViewNewsState createState() => _CardViewNewsState();
}

class _CardViewNewsState extends State<CardViewNews> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>launch(widget.url,
      forceWebView: true,
      forceSafariVC: true,
      enableJavaScript: true,
      ),
          child: Material(
        child: Container(
          height: 180,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: SafeArea(
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: <Widget>[
                    Container(
                        height: 180,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15)),
                          image: DecorationImage(image: NetworkImage(widget.image,),fit: BoxFit.fill)
                        ),
                       ),
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
      ),
    );
  }
}
