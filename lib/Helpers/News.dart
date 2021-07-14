import 'dart:convert';
import 'dart:math';

import 'package:flutternews/Models/ArticleModel.dart';

import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  String url =
      "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=5de46bd6cecb4cca920120b3d4891d75";

  Future<void> getNews() async {
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null &&
            element["description"] != null &&
            element["author"] != null &&
            element["content"] != null) {
          ArticleModel articleModel = ArticleModel(
              auther: element["auther"],
              content: element["content"],
              publishedAt: element["publishedAt"],
              title: element["title"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              description: element["description"]);

          news.add(articleModel);
        }
      });
    }
  }
}
