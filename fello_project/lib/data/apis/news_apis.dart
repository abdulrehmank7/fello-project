import 'dart:convert';

import 'package:fello_project/data/apis/utils.dart';
import 'package:fello_project/data/models/news_response.dart';
import 'package:http/http.dart' as http;

Future<NewsResponse?> getNews(String pageNo) async {
  var request = createGetRequest(getNewsUrl(pageNo));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final data = await response.stream.bytesToString();
    print(data);
    return NewsResponse.fromJson(jsonDecode(data));
  } else {
    print(response.reasonPhrase);
    return null;
  }
}
