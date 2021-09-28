import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:new_project/model/article.dart';

class ApiArticles {
  String? status;
  int? totalResults;
  List<Article>? articles;

  ApiArticles({this.status, this.totalResults, this.articles});

  ApiArticles.fromJson(Map<String, dynamic> json)
      : status = json["status"],
        totalResults = json["totalResults"],
        articles = List<Article>.from(
            json["articles"].map((e) => Article.fromJson(e)));

  ApiArticles.fromStringJson(String jsonString)
      : this.fromJson(json.decode(jsonString));

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResult": totalResults,
        "articles": List<dynamic>.from(articles!.map((e) => e.toJson()))
      };

  String toStringJson() => json.encode(this.toJson());

  bool isSucces() => status == "ok";

  static Future<ApiArticles> futureGetApiArticles() async {
    var dio = Dio();
    String _url = "https://newsapi.org/v2/top-headlines";
    try {
      Response response = await dio.get(_url, queryParameters: {
        "country": "us",
        "apiKey": "f042f5afa569414799e16461499611ee"
      });
      print(response.toString());
      return ApiArticles.fromStringJson(response.toString());
    } on DioError catch (e) {
      if (e.response == null) {
        return ApiArticles.fromStringJson(e.message);
      } else
        return ApiArticles.fromStringJson(e.message);
    }
  }
}
