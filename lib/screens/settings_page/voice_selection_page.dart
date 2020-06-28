import 'package:flutter/material.dart';
import 'package:hack2020/constants.dart';
import 'package:global_configuration/global_configuration.dart';

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
  String selectedVoice;

  @override
  void initState() {
    super.initState();
    selectedVoice = GlobalConfiguration().getString("voice");
  }

  void updateVoice(String voice) {
    voice != GlobalConfiguration().getString("voice")
        ? setState(() {
            selectedVoice = voice;
            GlobalConfiguration().updateValue("voice", voice);
            print(selectedVoice);
          })
        : {};
  }

//GlobalConfiguration().updateValue("voice", "Mizuki");
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListOptions(
          title: "Justin [English]",
          selectedVoice: selectedVoice,
          updateVoice: updateVoice,
        ),
        ListOptions(
          title: "Maja [Polish]",
          selectedVoice: selectedVoice,
          updateVoice: updateVoice,
        ),
        ListOptions(
          title: "Enrique [Spanish]",
          selectedVoice: selectedVoice,
          updateVoice: updateVoice,
        ),
        ListOptions(
          title: "Marlene [German]",
          selectedVoice: selectedVoice,
          updateVoice: updateVoice,
        ),
        ListOptions(
          title: "Mizuki [Japanese]",
          selectedVoice: selectedVoice,
          updateVoice: updateVoice,
        )
      ],
    );
  }
}

class ListOptions extends StatelessWidget {
  ListOptions(
      {@required this.title,
      @required this.selectedVoice,
      @required this.updateVoice});
  final String title;
  final String selectedVoice;
  final Function updateVoice;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: kPrimaryWhite),
      ),
      leading: Radio(
        value: title.split(new RegExp(r" "))[0],
        groupValue: selectedVoice,
        onChanged: updateVoice,
      ),
      onTap: () => updateVoice(title.split(new RegExp(r" "))[0]),
    );
  }
}
