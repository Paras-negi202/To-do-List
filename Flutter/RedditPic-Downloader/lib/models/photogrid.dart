import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:reddit_app/helper/post_list.dart';

import 'package:reddit_app/views/full_screen_view.dart';
import 'package:reddit_app/helper/constants.dart';

class PhotoGrid extends StatefulWidget {
  final String subreddit;

  final int index;

  PhotoGrid({this.subreddit,this.index});

  @override
  _PhotoGridState createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGrid> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      child: FutureBuilder(
        future: widget.index==-1?fetchPosts(widget.subreddit):fetchTopPosts(widget.subreddit,time[widget.index] ),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitPumpingHeart(
                  color: Colors.white,
                  size: 50.0,
                ),
              ],
            );
          }
          return GridView.count(crossAxisCount: 2,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            childAspectRatio: 0.5,
            mainAxisSpacing: 6.0,
            crossAxisSpacing: 6.0,
            children: snapshot.data.map<Widget>((post){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FullScreen(post: post,)));
                },
                child: GridTile(child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17),
                    child: Image.network(post.url,fit: BoxFit.cover,),
                  ),
                )
                ),
              );
            }).toList(),

          );
        },
      ),
    );
  }
}