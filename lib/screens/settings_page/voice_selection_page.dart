import 'package:flutter/material.dart';
import 'package:waifu.ai/constants.dart';
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
        // ignore: unnecessary_statements
        : {};
  }

//GlobalConfiguration().updateValue("voice", "Mizuki");
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ListOptions(
            title: "Justin [English - Default]",
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
            title: "Mathieu [French]",
            selectedVoice: selectedVoice,
            updateVoice: updateVoice,
          ),
          ListOptions(
            title: "Cristiano [Portuguese]",
            selectedVoice: selectedVoice,
            updateVoice: updateVoice,
          ),
          ListOptions(
            title: "Liv [Norwegian]",
            selectedVoice: selectedVoice,
            updateVoice: updateVoice,
          ),
          ListOptions(
            title: "Mizuki [Japanese]",
            selectedVoice: selectedVoice,
            updateVoice: updateVoice,
          ),
          ListOptions(
            title: "Carla [Italian]",
            selectedVoice: selectedVoice,
            updateVoice: updateVoice,
          ),
          ListOptions(
            title: "Carmen [Romanian]",
            selectedVoice: selectedVoice,
            updateVoice: updateVoice,
          ),
          ListOptions(
            title: "Tatyana [Russian]",
            selectedVoice: selectedVoice,
            updateVoice: updateVoice,
          ),
          ListOptions(
            title: "Astrid [Swedish]",
            selectedVoice: selectedVoice,
            updateVoice: updateVoice,
          ),
          ListOptions(
            title: "Filiz [Turkish]",
            selectedVoice: selectedVoice,
            updateVoice: updateVoice,
          ),
          ListOptions(
            title: "Gwyneth [Welsh]",
            selectedVoice: selectedVoice,
            updateVoice: updateVoice,
          ),
          ListOptions(
            title: "Karl [Icelandic]",
            selectedVoice: selectedVoice,
            updateVoice: updateVoice,
          ),
        ],
      ),
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
        activeColor: kAccentColor,
      ),
      onTap: () => updateVoice(title.split(new RegExp(r" "))[0]),
    );
  }
}
