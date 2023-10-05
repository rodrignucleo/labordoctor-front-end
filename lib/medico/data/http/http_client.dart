import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future get({required String url});

  Future put({required String url, required Map<String, dynamic> body});
  // Future<dynamic> post(String url, {Map<String, dynamic> body});
  // Future<dynamic> put(String url, {Map<String, dynamic> body});
  // Future<dynamic> delete(String url);
}

class HttpClient implements IHttpClient{
  final client = http.Client();

  @override
  Future get({required String url}) async {
    return await client.get(Uri.parse(url));
  }

  @override
  Future put({required String url, Map<String, dynamic>? body}) async {
    return await client.put(Uri.parse(url), body: body);
  }

  // @override
  // Future delete(String url) {
  //   // TODO: implement delete
  //   throw UnimplementedError();
  // }
  
  // @override
  // Future post(String url, {Map<String, dynamic> body}) {
  //   // TODO: implement post
  //   throw UnimplementedError();
  // }
  
  // @override
  // Future put(String url, {Map<String, dynamic> body}) {
  //   // TODO: implement put
  //   throw UnimplementedError();
  // }
}