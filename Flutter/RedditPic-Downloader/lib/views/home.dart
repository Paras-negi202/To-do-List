


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:reddit_app/helper/subreddits.dart';
import 'package:reddit_app/views/picview.dart';
import 'package:reddit_app/views/search.dart';
TextEditingController _controller = TextEditingController();
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool search_subreddit;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    search_subreddit=false;

  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('RedditApp'),
        centerTitle: true,
        backgroundColor: Colors.black,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 12, bottom: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: TextFormField(
                    onChanged: (value) {
                    },
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Search for subreddit",
                      contentPadding: EdgeInsets.only(left: 24),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      search_subreddit=true;
                    });

                  })
            ],
          ),
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            search_subreddit==true?Search_Subreddit(query: _controller.text,):
            ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: list.map<Widget>((category){
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PicView(subreddit: category.name,)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: Stack(
                        children: [
                          Container(
                            height: 200,
                            width: 350,
                            child: Image.asset(category.imgUrl,fit: BoxFit.cover,),
                          ),
                          Positioned(
                            left:0.0,
                            bottom: 0.0,
                            width: 350.0,
                            height: 70.0,
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black,
                                        Colors.black.withOpacity(0.0),
                                      ]
                                  )
                              ),
                            ),
                          ),
                          Positioned(
                              left: 10.0,
                              bottom: 10.0,
                              right: 10.0,
                              child: Text(
                                category.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            )
          ],
        ),
      )
    );
  }
}



// Center(
// child: FutureBuilder(
// future: _fetchPosts(),
// builder: (context,snapshot){
// if (snapshot.connectionState == ConnectionState.waiting) {
// return Center(child: CircularProgressIndicator());
// }
// return ListView.builder(
// physics: ClampingScrollPhysics(),
// itemCount: snapshot.data.length,
// itemBuilder: (context,index){
// return ListTile(
//
// title: Text(snapshot.data[index].title),
// );
// });
// },
// )
// ),