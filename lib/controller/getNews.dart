import 'dart:convert';
import 'package:news_app/model/news.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/APIsUrl.dart';
class GetNews {

  // Sports News
  Future<List<Map>> getSportsNews() async {
    News.sports = await http.get(APIs.sports);
    News.sports = jsonDecode(News.sports);
    return News.sports;
  }

  // Science News
  Future<List<Map>> getScienceNews() async {
    News.science = await http.get(APIs.science);
    News.science = jsonDecode(News.science);
    return News.science;
  }

  // Business News
  Future<List<Map>> getBusinessNews() async {
    News.business = await http.get(APIs.business);
    News.business = jsonDecode(News.business);
    return News.business;
  }

  // Health News
  Future<List<Map>> getHealthNews() async {
    News.health = await http.get(APIs.health);
    News.health = jsonDecode(News.health);
    return News.health;
  }

  // Entertainment News
  Future<List<Map>> getEntertainmentNews() async {
    News.entertainment = await http.get(APIs.entertainment);
    News.entertainment = jsonDecode(News.entertainment);
    return News.entertainment;
  }

  // Technology News
  Future<List<Map>> getTechnologyNews() async {
    News.technology = await http.get(APIs.technology);
    News.technology = jsonDecode(News.technology);
    return News.technology;
  }
}