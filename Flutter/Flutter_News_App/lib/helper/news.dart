
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/countries.dart';
class News{

List<ArticleModel> news=[];

Future<void> getNews(int index) async{
  String url="http://newsapi.org/v2/top-headlines?country=${country[index]}&apiKey=1f5446bc764e4542983c9e6d4b04232a";
  var response=await http.get(url);
  var jsonData=jsonDecode(response.body);
  if(jsonData['status']=="ok"){
    jsonData["articles"].forEach((element){
      if(element["urlToImage"]!=null && element["description"]!=null){
        ArticleModel articleModel=ArticleModel(
          title: element['title'],
          url: element['url'],
          author: element['author'],
          description: element['description'],
          urlToImage: element['urlToImage'],
          content: element['context'],

        );
        news.add(articleModel);
      }

    });
  }
}
}
class CategoryNews{

  List<ArticleModel> news=[];

  Future<void> getNews(String category,int index) async{
    String url="http://newsapi.org/v2/top-headlines?country=${country[index]}&category=$category&apiKey=1f5446bc764e4542983c9e6d4b04232a";

    var response=await http.get(url);
    var jsonData=jsonDecode(response.body);
    if(jsonData['status']=="ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"]!=null && element["description"]!=null){
          ArticleModel articleModel=ArticleModel(
            title: element['title'],
            url: element['url'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            content: element['context'],

          );
          news.add(articleModel);
        }

      });
    }
  }
}