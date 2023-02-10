import 'dart:convert';
import 'package:apinew_app/core/model/NewsResponse.dart';
import 'package:apinew_app/core/model/Source.dart';
import 'package:apinew_app/core/model/SourcseResponse.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static const String baseuUrl = 'newsapi.org';
  static const String apiKey = '9928ce6728d54a278fe60506a5915e1c';

  static Future<SourcseResponse> getSources(String categoryId) async {
    var url = Uri.http(baseuUrl, '/v2/top-headlines/sources', {
      // paramters
      'apiKey': apiKey,
      'category': categoryId,
    });
    var response = await http.get(url);
    // var bodyString = response.body;
    // var json = jsonDecode(bodyString);
    return SourcseResponse.fromJson(jsonDecode(response.body));
  }

  static Future<NewsResponse> getNews(
      {String? sourceId, String? searchKeyword}) async {
    //https://newsapi.org/v2/everything?
    // apiKey=9928ce6728d54a278fe60506a5915e1c
    // &sources=bbc-sport
    var Url = Uri.https(baseuUrl, 'v2/everything', {
      'apiKey': apiKey,
      'sources': sourceId,
      'q': searchKeyword,
    });
    var response = await http.get(Url);
    return NewsResponse.fromJson(jsonDecode(response.body));
  }
}
