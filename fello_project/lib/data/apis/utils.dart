import 'package:http/http.dart' as http;

const baseUrl = "https://newsapi.org/v2/everything?q=tech&";

const key = "a96ec1f00e04469b98a67e3351e65d4b";

http.Request createGetRequest(String url) => http.Request('GET', Uri.parse(url));

http.Request createPostRequest(String url) => http.Request('POST', Uri.parse(url));

http.Request createPutRequest(String url) => http.Request('PUT', Uri.parse(url));

String getNewsUrl(String pageNo) => '${baseUrl}pageSize=20&page=$pageNo&apiKey=$key';
