import 'dart:async';
import 'dart:convert';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hack2020/components/bot_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

class ChatPage extends StatelessWidget {
  static final String id = 'chat_page';
  final assetsAudioPlayer = AssetsAudioPlayer();

  Future<String> _loadURL() async {
    return await rootBundle.loadString('secrets.json');
  }

  Future<dynamic> playback(String text) async {
    final http.Response response = await getSpeech(text);

    try {
      await assetsAudioPlayer.open(
        Audio.network(jsonDecode(response.body)[0]['url']),
      );
    } catch (t) {
      //mp3 unreachable
      print("Doesn't work!");
    }

    return "Hi";
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

    return responseGet;
    //jsonDecode(responseGet.body)[0]['url']
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          child: RaisedButton(
            child: Text('Speak'),
            onPressed: () async {
              await playback('Hello how');
            },
          ),
        ),
      ),
      bottomNavigationBar: BotNavBar(),
    );
  }
}
