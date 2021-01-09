

import 'package:flutter/material.dart';

import 'package:reddit_app/helper/posts.dart';


class FullScreen extends StatefulWidget {
  final Post post;

  FullScreen({this.post});
  @override
  _FullScreenState createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  // File _imageFile;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('picview'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  widget.post.title,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '- ' + widget.post.author,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontStyle: FontStyle.italic),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Image.network(
                  widget.post.url,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: ()  {

                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width / 2,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white70),
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                          colors: [Color(0x36FFFFFF), Color(0x0FFFFFFF)]),
                    ),
                    child: Text(
                      'Image saved in gallery',
                      style: TextStyle(fontSize: 10, color: Colors.white70),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
