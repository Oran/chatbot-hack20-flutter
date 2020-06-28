import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

Future<String> _loadURL() async {
  return await rootBundle.loadString('secrets.json');
}

Future<http.Response> getSpeech(String text) async {
  String secret = await _loadURL();
  String postsURL = jsonDecode(secret)['api_justin'];
  final http.Response responsePost = await http.post(
    postsURL,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    },
    body: ('{"voice":"Justin","text":"' + text + '"}'),
  );

  if (responsePost.statusCode >= 200) {
    print("POST_SUCCESS");
  } else {
    print("POST_FAIL");
  }

  http.Response responseGet;
  bool flag = false;
  do {
    responseGet = await http.get(
      '$postsURL?postId=${responsePost.body.replaceAll('"', '')}',
    );

    if (responseGet.statusCode >= 200) {
      print("GET_SUCCESS");
      if (jsonDecode(responseGet.body)[0]['status'] != "PROCESSING") {
        flag = true;
      }
    } else {
      print("GET_FAIL");
    }
  } while (flag == false);

  print(responseGet.body);
  return responseGet;
  //jsonDecode(responseGet.body)[0]['url']
}
