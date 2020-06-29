import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import './small_containers.dart';
import 'package:waifu.ai/constants.dart';

class HosIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        // physics: BouncingScrollPhysics(),
        // scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(width: 20.0),
          SmallContainers(
            onPressed: () =>
                Navigator.pushNamed(context, chatPageID, arguments: ""),
            icon: LineAwesomeIcons.weixin,
            text: 'Chat',
          ),
          SizedBox(width: 20.0),
          SmallContainers(
            onPressed: () => Navigator.pushNamed(context, settingsPageID),
            icon: LineAwesomeIcons.cog,
            text: 'Settings',
          ),
          SizedBox(width: 20.0),
        ],
      ),
    );
  }
}
