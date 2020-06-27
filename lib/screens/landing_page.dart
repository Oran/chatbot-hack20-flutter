import 'package:flutter/material.dart';
import 'package:hack2020/services/network.dart';

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
