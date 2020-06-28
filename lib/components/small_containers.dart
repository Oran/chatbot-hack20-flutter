import 'package:flutter/material.dart';
import 'package:hack2020/constants.dart';

class SmallContainers extends StatelessWidget {
  SmallContainers({this.text, this.icon, this.onPressed});

  final String text;
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 100.0,
        width: 100.0,
        decoration: BoxDecoration(
          color: kPrimaryBlack,
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
            width: 2,
            color: kAccentColor,
          ),
        ),
        child: Center(
          child: Icon(
            icon,
            color: kAccentColor,
            size: 40.0,
          ),
        ),
      ),
    );
  }
}
