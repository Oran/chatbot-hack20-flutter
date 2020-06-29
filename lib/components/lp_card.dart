import 'package:flutter/material.dart';
import 'package:waifu.ai/constants.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class LPCard extends StatelessWidget {
  LPCard({this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, chatPageID, arguments: text),
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 5),
        height: 100.0,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: kAccentColor,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 15.0),
                child: Icon(
                  LineAwesomeIcons.comment,
                  size: 40.0,
                ),
              ),
              Text(
                '\"$text\"',
                style: GoogleFonts.roboto(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
