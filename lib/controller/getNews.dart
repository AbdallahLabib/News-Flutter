import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/APIsUrl.dart';
import 'package:news_app/model/NewsResult.dart';

class GetNews {

  Future<dynamic> getNewsByType(String type) async {
    String url="${APIs.mainLink}$type${APIs.apiKey}";
    print(url);
    http.Response response = await http.get(url);
  return NewsResult.fromJson(jsonDecode(response.body));
  }
}
