import 'package:apinew_app/core/model/Source.dart';

/// source : {"id":"bbc-news","name":"BBC News"}
/// author : "https://www.facebook.com/bbcnews"
/// title : "Australia helicopter crash: Couple were on post-Covid visit, family say"
/// description : "Ron and Diane Hughes were visiting relatives \"after being separated by Covid\", their family say."
/// url : "https://www.bbc.co.uk/news/uk-england-merseyside-64156885"
/// urlToImage : "https://ichef.bbci.co.uk/news/1024/branded_news/CED6/production/_128205925_239625084_10226778262502108_5561373895921256847_n.jpg"
/// publishedAt : "2023-01-05T11:13:44Z"
/// content : "A couple who died in a helicopter crash on Australia's Gold Coast had arrived in the country days before to visit relatives \"after being separated by Covid\", their family has said.\r\nDiane Hughes, 57,… [+2175 chars]"

class News {
  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,});

  News.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}