import 'package:flutter/material.dart';
import 'package:hack2020/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack2020/screens/chat_page.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import '../components/small_container.dart';

class LandingPage extends StatefulWidget {
  static final String id = 'landing_page';

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
        body: Container(
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
              ),
              Container(
                color: kPrimaryBlack,
                height: 520.0,
                child: GridView.count(
                  padding: EdgeInsets.all(10.0),
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  children: <Widget>[
                    SmallContainers(
                      icon: LineAwesomeIcons.cog,
                      onPressed: () {
                        Navigator.pushNamed(context, settingsPageID);
                      },
                    ),
                    SmallContainers(
                      icon: LineAwesomeIcons.weixin,
                      onPressed: () {
                        Navigator.pushNamed(context, ChatPage.id);
                      },
                    ),
                    // SmallContainers(icon: Icons.satellite,),
                    // SmallContainers(icon: Icons.satellite,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
