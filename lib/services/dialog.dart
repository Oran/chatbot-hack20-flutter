import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

Future<String> getResponse(String query) async {
  AuthGoogle authGoogle =
      await AuthGoogle(fileJson: 'assets/ai-bot-281615-3c7bd40e8810.json')
          .build();
  Dialogflow dialogflow = Dialogflow(
    authGoogle: authGoogle,
    sessionId: '123456',
  );
  DetectIntentResponse response =
      await dialogflow.detectIntentFromText(query, 'en');
  return response.queryResult.fulfillmentText;
}
