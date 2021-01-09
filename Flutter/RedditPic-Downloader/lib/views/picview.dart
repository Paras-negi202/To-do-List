import 'package:flutter/material.dart';
import 'package:reddit_app/models/photogrid.dart';

import 'package:reddit_app/helper/constants.dart';
class PicView extends StatefulWidget {
  final String subreddit;


  PicView({this.subreddit});

  @override
  _PicViewState createState() => _PicViewState();
}

class _PicViewState extends State<PicView> {
  int _selectedindex=-1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          widget.subreddit,style: dropDownLabelStyle,
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          PopupMenuButton(
            onSelected: (index){
              setState(() {
                _selectedindex=index;
              });

            },
              child: Row(
                children: [
                  Text(
                    _selectedindex==-1?'Top':list[_selectedindex],
                    style: dropDownLabelStyle,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                ],
              ),
              itemBuilder: (context)=> <PopupMenuItem<int>>[
                PopupMenuItem(
                  child: Text(list[0]),
                  textStyle: dropDownMenuItemStyle,
                  value: 0,
                ),
                PopupMenuItem(
                  child: Text(list[1]),
                  textStyle: dropDownMenuItemStyle,
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text(list[2]),
                  textStyle: dropDownMenuItemStyle,
                  value: 2,
                ),
                PopupMenuItem(
                  child: Text(list[3]),
                  textStyle: dropDownMenuItemStyle,
                  value: 3,
                ),
                PopupMenuItem(
                  child: Text(list[4]),
                  textStyle: dropDownMenuItemStyle,
                  value: 4,
                ),
                PopupMenuItem(
                  child: Text(list[5]),
                  textStyle: dropDownMenuItemStyle,
                  value: 5,
                ),
              ],)
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              PhotoGrid(subreddit: widget.subreddit,index: _selectedindex,),
            ],
          ),
        ),
      ),
    );
  }
}
