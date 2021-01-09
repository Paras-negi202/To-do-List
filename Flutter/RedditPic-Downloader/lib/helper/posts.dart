class Post{
  String title;
  String url;
  String author;

  Post({this.title,this.url,this.author});

  factory Post.fromJson(Map<String,dynamic> json){
    return Post(title: json['title'],url:json['url'],author: json['author'] );
  }
}