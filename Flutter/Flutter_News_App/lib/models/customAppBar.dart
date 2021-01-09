import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:news_app/index_change.dart';
final bottomNavigationBarItemStyle =
    TextStyle(fontStyle: FontStyle.normal, color: Colors.black);
 List<BottomNavigationBarItem> bottomBarItems = [
   BottomNavigationBarItem(
     icon: Icon(
       CupertinoIcons.news,
       color: Colors.black,
     ),

     // ignore: deprecated_member_use
     title: Text("India",
         style: bottomNavigationBarItemStyle.copyWith(color: Colors.black)),
   ),
   BottomNavigationBarItem(
     icon: new Icon(
       CupertinoIcons.news,
       color: Colors.black,
     ),
     // ignore: deprecated_member_use
     title: Text(
       "US",
       style: bottomNavigationBarItemStyle,
     ),
   ),

   BottomNavigationBarItem(
     icon: new Icon(
       CupertinoIcons.news,
       color: Colors.black,
     ),
     // ignore: deprecated_member_use
     title: Text(
       "UK",
       style: bottomNavigationBarItemStyle,
     ),
   ),


   BottomNavigationBarItem(
     icon: new Icon(
       CupertinoIcons.news,
       color: Colors.black,
     ),
     // ignore: deprecated_member_use
     title: Text(
       "NZ",
       style: bottomNavigationBarItemStyle,
     ),
   ),

 ];

class CustomAppBottomBar extends StatefulWidget {
  final Function onTap;

  CustomAppBottomBar({this.onTap});

  @override
  _CustomAppBottomBarState createState() => _CustomAppBottomBarState();
}

class _CustomAppBottomBarState extends State<CustomAppBottomBar> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final state=Provider.of<Index>(context);
    return Material(
      elevation: 15.0,
      child: BottomNavigationBar(
        items: bottomBarItems,
        currentIndex: state.idx,
        onTap: widget.onTap,

        selectedItemColor: Colors.red,
        // selectedLabelStyle: TextStyle(color: Colors.red),
        // elevation: 10.0,

        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
