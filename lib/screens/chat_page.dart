import 'dart:async';
import 'dart:convert';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
import 'package:hack2020/constants.dart';
import 'package:hack2020/services/network.dart';
import 'package:hack2020/components/bot_nav_bar.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

class ChatPage extends StatelessWidget {
  static final String id = 'chat_page';
  final assetsAudioPlayer = AssetsAudioPlayer();

  Future<String> _loadURL() async {
    return await rootBundle.loadString('secrets.json');
  }

  void onSend(ChatMessage message) async {
    messages.add(message);
    String response = await getResponse(message.text);
    ChatMessage reply;
    if (response != null) {
      reply = ChatMessage(
        text: response,
        user: ChatUser(
          containerColor: kAccentGrey,
          color: kPrimaryWhite,
          name: "Fayeed",
          uid: "xxxxxxxxxy",
          avatar:
              "https://www.wrappixel.com/ampleadmin/assets/images/users/3.jpg",
        ),
        createdAt: DateTime.now(),
        quickReplies: QuickReplies(),
      );
    } else {
      reply = ChatMessage(
        text: "Sorry, cannot process that!",
        user: ChatUser(
          containerColor: kColorLightGrey,
          color: kPrimaryWhite,
          name: "Fayeed",
          uid: "xxxxxxxxxy",
          avatar:
              "https://www.wrappixel.com/ampleadmin/assets/images/users/3.jpg",
        ),
        createdAt: DateTime.now(),
        quickReplies: QuickReplies(),
      );
    }
    messages.add(reply);
  }

  final List<ChatMessage> messages = List<ChatMessage>();

  Widget sendIcon() {
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.ac_unit),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBlack,
      bottomNavigationBar: BotNavBar(),
      body: DashChat(
        scrollToBottom: false,
        user: ChatUser(
          containerColor: kAccentColor,
          color: kColorBlack,
          name: "Jhon Doe",
          uid: "xxxxxxxxx",
          avatar:
              "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
        ),
        onSend: onSend,
        messages: messages,
        showAvatarForEveryMessage: true,
        showUserAvatar: true,
        inputContainerStyle: BoxDecoration(color: kPrimaryBlack),
        inputCursorColor: kAccentColor,
        inputTextStyle: TextStyle(color: kPrimaryWhite),
        inputDecoration: InputDecoration(
          hintText: 'Type here',
          hintStyle: TextStyle(color: kAccentGrey),
        ),
        
      ),
      /* child: RaisedButton(
              child: Text('Speak'),
              onPressed: () async {
                //Add default response in Dialogflow so the app doesn't work.
                await playback(await getResponse("hello"));
              },
            ), */
    );
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

    print(responseGet.body);
    return responseGet;
    //jsonDecode(responseGet.body)[0]['url']
  }
}
