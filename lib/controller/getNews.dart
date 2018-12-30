import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/APIsUrl.dart';
import 'package:news_app/model/NewsResult.dart';
import 'package:news_app/model/news.dart';

class GetNews {
  // Sports News
  Future<dynamic> getSportsNews() async {
    http.Response response = await http.get(APIs.sports);
    News.sports = NewsResult.fromJson(jsonDecode(response.body));
    return News.sports;
  }

  // Science News
  Future<dynamic> getScienceNews() async {
    http.Response response = await http.get(APIs.science);
    News.science = NewsResult.fromJson(jsonDecode(response.body));
    return News.science;
  }

  // Business News
  Future<dynamic> getBusinessNews() async {
    http.Response response = await http.get(APIs.business);
    News.business = NewsResult.fromJson(jsonDecode(response.body));
    return News.business;
  }

  // Health News
  Future<dynamic> getHealthNews() async {
    http.Response response = await http.get(APIs.health);
    News.health = NewsResult.fromJson(jsonDecode(response.body));
    return News.health;
  }

  // Entertainment News
  Future<dynamic> getEntertainmentNews() async {
    http.Response response = await http.get(APIs.entertainment);
    News.entertainment = NewsResult.fromJson(jsonDecode(response.body));
    return News.entertainment;
  }

  // Technology News
  Future<dynamic> getTechnologyNews() async {
    http.Response response = await http.get(APIs.technology);
    News.technology = NewsResult.fromJson(jsonDecode(response.body));
    return News.technology;
  }
}
