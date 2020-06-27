import 'package:flutter/material.dart';
import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

class LandingPage extends StatefulWidget {
  static final String id = 'landing_page';

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Future getResponse(String query) async {
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: 'assets/ai-bot-281615-3c7bd40e8810.json')
            .build();
    Dialogflow dialogflow = Dialogflow(
      authGoogle: authGoogle,
      sessionId: '123456',
    );
    DetectIntentResponse response =
        await dialogflow.detectIntentFromText(query, 'en');
    print(response.queryResult.fulfillmentText);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          child: Center(
            child: RaisedButton(
              onPressed: () {
                getResponse('hi');
              },
            ),
          ),
        ),
      ),
    );
  }
}
