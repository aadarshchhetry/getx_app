import 'url.dart';
import 'package:http/http.dart' as http;

class Request {
  final String url;
  final dynamic body;
  Request({this.url, this.body});

  Future<http.Response> post() {
    print("post called");
    return http.post(urlBase + url, body: body).timeout(Duration(seconds: 5));
  }

  Future<http.Response> get() {
    return http.get(urlBase + url).timeout(Duration(seconds: 25));
  }
}
