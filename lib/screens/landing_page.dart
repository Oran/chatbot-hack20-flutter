import 'package:flutter/material.dart';
import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart' as df;
import 'package:hack2020/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/bot_nav_bar.dart';

class LandingPage extends StatefulWidget {
  static final String id = 'landing_page';

  @override
  _LandingPageState createState() => _LandingPageState();
}

//Works as of 27/06/2020.
//Docs were wrong as to how to fetch the response text.
//Use fulfillmentText instead of queryText (which makes total sense!!)
class _LandingPageState extends State<LandingPage> {
  Future getResponse(String query) async {
    df.AuthGoogle authGoogle =
        await df.AuthGoogle(fileJson: 'assets/ai-bot-281615-3c7bd40e8810.json')
            .build();
    df.Dialogflow dialogflow = df.Dialogflow(
      authGoogle: authGoogle,
      sessionId: '123456',
    );
    df.DetectIntentResponse response =
        await dialogflow.detectIntentFromText(query, 'en');
    print(response.queryResult.fulfillmentText);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryBlack,
        body: Container(
          decoration: BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  '<App Name>',
                  style: GoogleFonts.pressStart2p(
                    color: kAccentColor,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Divider(
                color: kAccentDarkGrey,
                thickness: 2.0,
                indent: 40.0,
                endIndent: 40.0,
              ),
              Text(
                'ChatBot A.I',
                style: GoogleFonts.cantarell(
                  color: kAccentGrey,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BotNavBar(),
      ),
    );
  }
}
