import 'dart:convert';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:hack2020/services/tts.dart';
import 'package:http/http.dart' as http;

final assetsAudioPlayer = AssetsAudioPlayer();

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
