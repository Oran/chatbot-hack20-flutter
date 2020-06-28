import 'package:flutter/material.dart';
import 'package:hack2020/constants.dart';

class VoiceSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: kPrimaryBlack,
        appBar: AppBar(
          backgroundColor: kPrimaryBlack,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: kAccentColor,
            ),
            onPressed: () => Navigator.pushNamed(context, settingsPageID),
          ),
          title: Text("Settings"),
          centerTitle: true,
        ),
        body: VoiceSelector(),
      ),
    );
  }
}

class VoiceSelector extends StatefulWidget {
  @override
  _VoiceSelectorState createState() => _VoiceSelectorState();
}

//TODO: Implement Initial State of what's in the settings.json

class _VoiceSelectorState extends State<VoiceSelector> {
  String selected;
  @override
  Widget build(BuildContext context) {
    return Column(
      
    );
  }
}
