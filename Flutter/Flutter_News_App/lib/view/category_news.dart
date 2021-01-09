import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/blog_tile.dart';

class Category_News extends StatefulWidget {
  final String category;

  final int index;
  Category_News({this.category,this.index});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<Category_News> {
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  getNews() async {
    CategoryNews newsClass = CategoryNews();
    await newsClass.getNews(widget.category.toLowerCase(),widget.index);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    // final state=Provider.of<Index>(context);
    return Scaffold(
      appBar: AppBar(
        leading: MaterialButton(
          elevation: 10.0,
          onPressed: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back,
            color: Colors.black,)),
        backgroundColor: Colors.white,
        // leading: Icon(),
        title: Text(
          widget.category,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading == true
          ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ):SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 16),
                child: ListView.builder(
                  itemCount: articles.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) => BlogTile(
                    imageUrl: articles[index].urlToImage,
                    title: articles[index].title,
                    desc: articles[index].description,
                    url: articles[index].url,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}




