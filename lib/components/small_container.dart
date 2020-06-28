import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack2020/constants.dart';

class SmallContainers extends StatelessWidget {
  SmallContainers({this.text, this.icon, this.onPressed});

  String text;
  final IconData icon;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 80.0,
        width: 80.0,
        decoration: BoxDecoration(
          color: kAccentDarkGrey,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: kAccentColor,
              size: 70.0,
            ),
            Text(
              text == null ? text = ' ' : text,
              style: GoogleFonts.quicksand(
                color: kAccentColor,
                fontSize: 10.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
