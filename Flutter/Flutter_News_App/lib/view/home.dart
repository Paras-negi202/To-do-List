import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/index_change.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/helper/news.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/view/category_news.dart';
import 'package:news_app/blog_tile.dart';
import 'package:news_app/models/customAppBar.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews(0);
  }

  getNews(int index) async {
    News newsClass = News();
    await newsClass.getNews(index);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final state=Provider.of<Index>(context);
    return Scaffold(
      bottomNavigationBar: CustomAppBottomBar(
        onTap: (index) {
          setState(() {
            state.idx=index;
            _loading=true;
          });
          getNews(state.idx);
        },
      ),

      appBar: AppBar(


        backgroundColor: Colors.white,
        centerTitle: true,
        title: Padding(
          padding:  EdgeInsets.only(right: 30),

          child: RichText(
            text: TextSpan(
              text: 'Hello ',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
              children: <TextSpan>[
                TextSpan(text: 'Flutter', style: TextStyle(color: Colors.black,
                fontSize: 25)),
                TextSpan(text: 'News',
                style: TextStyle(
                  color: Colors.blue,
                    fontSize: 25
                ),
                ),
              ]
            ),
          ),
        ),
        elevation: 0.0,
      ),
      body: _loading == true
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => CategoryTile(
                                imageUrl: categories[index].categoryUrl,
                                categoryName: categories[index].categoryName,
                              )),
                    ),
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

class CategoryTile extends StatelessWidget {
  CategoryTile({this.imageUrl, this.categoryName});
  final String imageUrl, categoryName;
  @override
  Widget build(BuildContext context) {
    final state=Provider.of<Index>(context);
    return Parent(
      style: ParentStyle()..elevation(30),
      child: GestureDetector(
        onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>Category_News(category: categoryName,index: state.idx,))),
        child: Container(
          margin: EdgeInsets.only(right: 16),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 120,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black26,
                ),
                child: Text(
                  categoryName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


