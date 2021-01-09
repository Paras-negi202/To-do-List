

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit_app/helper/post_list.dart';
import 'package:reddit_app/views/picview.dart';

class Search_Subreddit extends StatefulWidget {
  final String query;

  Search_Subreddit({this.query});
  @override
  _Search_SubredditState createState() => _Search_SubredditState();
}

class _Search_SubredditState extends State<Search_Subreddit> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: search(widget.query),
          builder: (context,snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: snapshot.data.length,
            itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: ListTile(
                tileColor: Colors.black26,
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PicView(subreddit: snapshot.data[index]['display_name_prefixed'])));
                },
                leading: CircleAvatar(
                  child: Image.network(snapshot.data[index]['icon_img']!=null?snapshot.data[index]['icon_img']:snapshot.data[index]['header_img']),
                ),
                title: Text(snapshot.data[index]['display_name_prefixed'],
                
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),),
                subtitle: Text(snapshot.data[index]['public_description'],
                overflow: TextOverflow.ellipsis,),
              ),
            ),
          );
        });
      }),
    );
  }
}
