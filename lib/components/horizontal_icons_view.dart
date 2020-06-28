import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import './small_containers.dart';
import 'package:hack2020/constants.dart';

class HosIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        // physics: BouncingScrollPhysics(),
        // scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(width: 20.0),
          SmallContainers(
            onPressed: () {
              Navigator.pushNamed(context, settingsPageID);
            },
            icon: LineAwesomeIcons.cog,
          ),
          SizedBox(width: 20.0),
          SmallContainers(
            onPressed: () {
              Navigator.pushNamed(context, chatPageID);
            },
            icon: LineAwesomeIcons.weixin,
          ),
          SizedBox(width: 20.0),
          // SmallContainers(
          //   icon: Icons.videogame_asset,
          // ),
          // SizedBox(width: 20.0),
        ],
      ),
    );
  }
}
