import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:hack2020/constants.dart';

class BotNavBar extends StatelessWidget {
  const BotNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          color: kPrimaryBlack,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, landingPageID);
              },
              child: Icon(
                LineAwesomeIcons.home,
                color: kAccentColor,
                size: 40.0,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, chatPageID);
              },
              child: Icon(
                LineAwesomeIcons.weixin,
                color: kAccentColor,
                size: 40.0,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, settingsPageID);
              },
              child: Icon(
                LineAwesomeIcons.cog,
                color: kAccentColor,
                size: 40.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
