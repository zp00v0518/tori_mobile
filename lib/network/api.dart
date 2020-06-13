import 'package:http/http.dart' as http;
import 'dart:convert';

Map<String, String> headers = {
  'Content-Type': 'application/x-www-form-urlencoded',
  'Authorization': 'Basic ZGVjaW1hOmRpZ2l0YWw=',
  'User-Agent':
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',
  'accept':
      'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9'
};

class Api {
  Future postResponse(String url, Map data) async {
    http.Response response = await http.post(url, body: data, headers: headers);
    var result = await handleResponse(response);

    return separateResponse(result);
  }

  Future getResponse(String url) async {
    http.Response response = await http.get(url, headers: headers);
    var result = await handleResponse(response);
    return separateResponse(result);
  }
}

handleResponse(response) async {
  var result = response;
  final cookie = response.headers['set-cookie'];
  headers['cookie'] = cookie;
  if (response.statusCode == 302) {
    final url = response.headers['location'];
    if (url != null) {
      Api api = Api();
      result = await api.getResponse(url);
    }
  }
  return result;
}

separateResponse(response) {
  if (response.runtimeType != http.Response) return response;
  var decodeData;
  String data = response.body;
  try {
    decodeData = jsonDecode(data);
  } catch (err) {}
  Map <String, dynamic> result = {
    'data': decodeData != null ? decodeData : response.body,
    'x-route-name': response.headers['x-route-name'],
  };
  return result;
}
