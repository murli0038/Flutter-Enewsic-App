import 'package:news_app/articalModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class News
{
  List<ArticleModel> news = [];



  Future<void> getNews() async
  {
    String url = "http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=1793b1c171814b77b0e52dde524164eb";

    var response = await http.get(url);

    var jsondata = jsonDecode(response.body);

    if (jsondata["status"] == "ok")
      {
        jsondata["articles"].forEach((element){
            if(element["urlToImage"] != null && element["description"] != null )
              {
                ArticleModel artical = ArticleModel(
                    title: element["title"],
                    author: element["author"],
                    description: element["description"],
                    url: element["url"],
                    urlToImage: element["urlToImage"],
                    // publishedAt: element["publishedAt"],
                    content: element["content"]
                );
                news.add(artical);
              }
        });
      }
  }
}

class CategoryNewsClass
{
  List<ArticleModel> news = [];



  Future<void> getNews(String categoryNuName) async
  {
    String url = "http://newsapi.org/v2/top-headlines?category=$categoryNuName&country=in&category=business&pageSize=100&apiKey=1793b1c171814b77b0e52dde524164eb";

    var response = await http.get(url);

    var jsondata = jsonDecode(response.body);

    if (jsondata["status"] == "ok")
    {
      jsondata["articles"].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null )
        {
          ArticleModel artical = ArticleModel(
              title: element["title"],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              // publishedAt: element["publishedAt"],
              content: element["content"]
          );
          news.add(artical);
        }
      });
    }
  }
}