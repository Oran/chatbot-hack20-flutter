import 'package:flutter/material.dart';
import 'package:hack2020/constants.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBlack,
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Center(
              child: Text(
                'Ai',
                style: TextStyle(
                  color: kPrimaryWhite,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: kPrimaryBlack,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: Colors.white),
              ),
              child: TextField(
                cursorColor: kAccentColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(20.0),
                  hintText: "Type something...",
                  hintStyle: TextStyle(
                    color: kAccentGrey,
                  ),
                ),
                style: TextStyle(
                  color: kPrimaryWhite,
                ),
              ),
            ),
            Flexible(
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(
                      top: 16.0,
                      bottom: 16.0,
                      left: 24.0,
                      right: 24.0,
                    ),
                    height: 92.0,
                    decoration: new BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2),
                      color: kPrimaryBlack,
                      shape: BoxShape.rectangle,
                      borderRadius: new BorderRadius.circular(8.0),
                      boxShadow: <BoxShadow>[
                        new BoxShadow(
                          color: Colors.purple,
                          blurRadius: 10.0,
                          //offset: new Offset(0.0, 10.0),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 16.0,
                      bottom: 16.0,
                      left: 24.0,
                      right: 24.0,
                    ),
                    height: 93.0,
                    decoration: new BoxDecoration(
                      border: Border.all(color: kAccentColor),
                      color: kPrimaryBlack,
                      shape: BoxShape.rectangle,
                      borderRadius: new BorderRadius.circular(8.0),
                      boxShadow: <BoxShadow>[
                        new BoxShadow(
                          color: kAccentColor,
                          blurRadius: 10.0,
                          //offset: new Offset(0.0, 10.0),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 16.0,
                      bottom: 16.0,
                      left: 24.0,
                      right: 24.0,
                    ),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: new EdgeInsets.only(left: 46.0),
                          height: 93.0,
                          decoration: new BoxDecoration(
                            border: Border.all(color: Colors.red),
                            color: kPrimaryBlack,
                            shape: BoxShape.rectangle,
                            borderRadius: new BorderRadius.circular(8.0),
                            boxShadow: <BoxShadow>[
                              new BoxShadow(
                                color: Colors.red,
                                blurRadius: 10.0,
                                //offset: new Offset(0.0, 10.0),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.music_note, size: 93,),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 16.0,
                      bottom: 16.0,
                      left: 24.0,
                      right: 24.0,
                    ),
                    height: 93.0,
                    decoration: new BoxDecoration(
                      border: Border.all(color: Colors.pink),
                      color: kPrimaryBlack,
                      shape: BoxShape.rectangle,
                      borderRadius: new BorderRadius.circular(8.0),
                      boxShadow: <BoxShadow>[
                        new BoxShadow(
                          color: Colors.pink,
                          blurRadius: 10.0,
                          //offset: new Offset(0.0, 10.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
