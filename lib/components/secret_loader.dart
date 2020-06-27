import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class SecretLoader {
  final String secretPath;

  SecretLoader({this.secretPath});
  Future<Secret> load() {
    return rootBundle.loadStructuredData<Secret>(this.secretPath,
        (jsonStr) async {
      final secret = Secret.fromJson(json.decode(jsonStr));
      return secret;
    });
  }
}

class Secret {
  final String apiURL;
  Secret({this.apiURL = ""});

  factory Secret.fromJson(Map<String, dynamic> jsonMap) {
    return new Secret(apiURL: jsonMap["api_justin"]);
  }
}
