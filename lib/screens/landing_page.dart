import 'package:flutter/material.dart';
import 'package:hack2020/components/horizontal_icons_view.dart';
import 'package:hack2020/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neon/neon.dart';
import '../components/lp_card.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

//Works as of 27/06/2020.
//Docs were wrong as to how to fetch the response text.
//Use fulfillmentText instead of queryText (which makes total sense!!)
class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryBlack,
        body: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Neon(
                          text: 'waifu.ai',
                          glowing: true,
                          font: NeonFont.Beon,
                          fontSize: 40.0,
                          color: Colors.green,
                          flickeringText: true,
                          flickeringLetters: [7, 6],
                        ),
                      ),
                      Divider(
                        color: kAccentDarkGrey,
                        thickness: 2.0,
                        indent: 40.0,
                        endIndent: 40.0,
                      ),
                      Text(
                        'ChatBot A.I.',
                        style: GoogleFonts.lekton(
                          color: kAccentGrey,
                          fontSize: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                HosIcons(),
                SizedBox(height: 20.0),
                Expanded(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      LPCard(text: 'Hello'),
                      LPCard(text: 'Who are you?'),
                      LPCard(text: 'Tell me a joke'),
                      LPCard(text: 'Ha ha ha!'),
                      LPCard(text: 'You\'re so clever'),
                      LPCard(text: 'Are you happy?'),
                      LPCard(text: 'Are we friends?'),
                      LPCard(text: 'Thank you'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
