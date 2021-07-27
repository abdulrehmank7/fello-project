import 'package:fello_project/data/models/source.dart';

/// source : {"id":"techcrunch","name":"TechCrunch"}
/// author : "Zack Whittaker"
/// title : "Indian tech startup exposed Byju’s student data"
/// description : "India-based technology startup Salesken.ai has secured an exposed server that was spilling private and sensitive data on one of its customers, Byju’s, an education technology giant and India’s most valuable startup. The server was left unprotected since at le…"
/// url : "http://techcrunch.com/2021/06/29/india-startup-byju-student-data/"
/// urlToImage : "https://techcrunch.com/wp-content/uploads/2021/06/GettyImages-1133907439.jpg?w=599"
/// publishedAt : "2021-06-30T04:30:24Z"
/// content : "India-based technology startup Salesken.ai has secured an exposed server that was spilling private and sensitive data on one of its customers, Byju’s, an education technology giant and India’s most v… [+2617 chars]"

class Articles {
  Source? _source;
  String? _author;
  String? _title;
  String? _description;
  String? _url;
  String? _urlToImage;
  String? _publishedAt;
  String? _content;

  Source? get source => _source;
  String? get author => _author;
  String? get title => _title;
  String? get description => _description;
  String? get url => _url;
  String? get urlToImage => _urlToImage;
  String? get publishedAt => _publishedAt;
  String? get content => _content;

  Articles(
      {Source? source,
      String? author,
      String? title,
      String? description,
      String? url,
      String? urlToImage,
      String? publishedAt,
      String? content}) {
    _source = source;
    _author = author;
    _title = title;
    _description = description;
    _url = url;
    _urlToImage = urlToImage;
    _publishedAt = publishedAt;
    _content = content;
  }

  Articles.fromJson(dynamic json) {
    _source = json["source"] != null ? Source.fromJson(json["source"]) : null;
    _author = json["author"];
    _title = json["title"];
    _description = json["description"];
    _url = json["url"];
    _urlToImage = json["urlToImage"];
    _publishedAt = json["publishedAt"];
    _content = json["content"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_source != null) {
      map["source"] = _source?.toJson();
    }
    map["author"] = _author;
    map["title"] = _title;
    map["description"] = _description;
    map["url"] = _url;
    map["urlToImage"] = _urlToImage;
    map["publishedAt"] = _publishedAt;
    map["content"] = _content;
    return map;
  }
}
