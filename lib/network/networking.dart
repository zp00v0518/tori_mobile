import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  Map<String, String> headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Authorization': 'Basic ZGVjaW1hOmRpZ2l0YWw=',
    'User-Agent':
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36',
    'accept':
        'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9'
  };
  final String url;
  Future getData() async {
    http.Response response = await http.post(url,
        body: {
          '_csrf_token': 'TgRXUMvJl2qP21nrumtxfspGjbS4KJVr8LtPLvDg3mk',
          '_username': 'demo@toriapps.com',
          '_password': 'Demo2019!',
          'submitBtn': 'on'
        },
        headers: headers);
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      return data;
    } else if (response.statusCode == 302) {
      print(response.headers['location']);
    } else {
      print(response.statusCode);
    }
  }
}
