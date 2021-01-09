
import 'dart:convert';

import 'package:reddit_app/helper/posts.dart';
import 'package:http/http.dart' as http;
Future<List<Post>> fetchPosts(String subreddit) async{
  List<Post> posts=[];
  final response=await http.get('https://www.reddit.com/$subreddit/.json');
  final data=jsonDecode(response.body);

  for(Map d in data['data']['children']){

    if(d['data']['url'].toString().contains('jpg') || d['data']['url'].toString().contains('png')) {
      Post post = Post.fromJson(d['data']);
      print(post.title);
      posts.add(post);
    }
  }
  print('posts length is ${posts.length}');
  return posts;
}

Future<List<Post>> fetchTopPosts(String subreddit,String time) async{
  List<Post> posts=[];
  final response=await http.get('https://www.reddit.com/$subreddit/top/.json?t=$time');
  final data=jsonDecode(response.body);

  for(Map d in data['data']['children']){

    if(d['data']['url'].toString().contains('jpg') || d['data']['url'].toString().contains('png')) {
      Post post = Post.fromJson(d['data']);
      print(post.title);
      posts.add(post);
    }
  }
  print('posts length is ${posts.length}');
  return posts;
}

Future <List<Map>> search(String q) async{
  List<Map> subreddits=[];
  final response=await http.get('https://www.reddit.com/search/.json?q=$q&type=sr%2Cuser');
  final data=jsonDecode(response.body);

  for(Map d in data['data']['children']){
    {
      if(d['kind']=='t5')
        subreddits.add(d['data']);
    }
  }
  // print('posts length is ${posts.length}');
  return subreddits;
}