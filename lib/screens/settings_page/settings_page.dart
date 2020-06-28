import 'package:flutter/material.dart';
import 'package:hack2020/constants.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBlack,
      appBar: AppBar(
        backgroundColor: kPrimaryBlack,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kAccentColor,
          ),
          onPressed: () => Navigator.pushNamed(context, landingPageID),
        ),
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0),
              Text(
                "As this is a development build, most settings are disabled!",
                style: TextStyle(
                  color: kPrimaryWhite,
                ),
              ),
              SizedBox(height: 40.0),
              SettingItem(
                text: "Voice Selection",
                icon: Icon(
                  Icons.keyboard_voice,
                  color: kPrimaryWhite,
                ),
                pageId: voiceSelectionPageID,
              ),
              SettingItem(
                text: "Language Selection",
                enabled: false,
                icon: Icon(
                  Icons.language,
                  color: kPrimaryWhite,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                "Extra",
                style: TextStyle(
                  color: kAccentColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SwitchListTile(
                activeColor: kAccentColor,
                contentPadding: const EdgeInsets.all(0),
                value: true,
                title: Text(
                  'Enable Voice',
                  style: TextStyle(
                    color: kPrimaryWhite,
                  ),
                ),
                onChanged: (val) {},
              ),
              SwitchListTile(
                activeColor: kAccentColor,
                contentPadding: const EdgeInsets.all(0),
                value: false,
                title: Text(
                  'Enable Dev-Mode',
                  style: TextStyle(
                    color: kPrimaryWhite,
                  ),
                ),
                onChanged: (val) {},
              ),
              SwitchListTile(
                activeColor: kAccentColor,
                contentPadding: const EdgeInsets.all(0),
                value: false,
                title: Text(
                  'Enable Voice-input',
                  style: TextStyle(
                    color: kPrimaryWhite,
                  ),
                ),
                onChanged: (val) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  SettingItem({this.text, this.enabled = true, this.icon, this.pageId});
  final String text;
  final bool enabled;
  final Icon icon;
  final String pageId;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.fromLTRB(32.0, 1.0, 32.0, 8.0),
      color: kAccentDarkGrey,
      child: ListTile(
        onTap: () => enabled
            ? Navigator.pushNamed(context, voiceSelectionPageID)
            : snackbar(context, text), //Open change voice
        title: Text(
          text,
          style: TextStyle(
            color: kPrimaryWhite,
            fontWeight: FontWeight.w500,
          ),
        ),
        // leading: CircleAvatar(
        //   backgroundColor: Colors.red,
        // ),
        leading: icon,
        trailing: Icon(Icons.keyboard_arrow_right, color: kAccentColor),
      ),
    );
  }

  void snackbar(BuildContext context, text) {
    SnackBar disabled = new SnackBar(
      content: Text("Sorry! '$text' has not yet been implemented."),
    );
    Scaffold.of(context).showSnackBar(disabled);
  }
}
