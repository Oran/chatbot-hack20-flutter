import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hack2020/constants.dart';
import 'package:hack2020/screens/landing_page.dart';
import 'package:hack2020/services/audio_player.dart';
import 'package:hack2020/services/dialog.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class ChatPage extends StatefulWidget {
  static final String id = 'chat_page';
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textController = new TextEditingController();
  final ScrollController _scrollController = new ScrollController();

  String currentUser = "1";
  String pairId = "99";
  bool isLoading = false;
  String reply;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    _handleSubmitted("Introduction", "99");
  }

  List<ChatItemModel> chatItems = [];

  void _handleSubmitted(String text, String user) async {
    _textController.clear();
    reply = '';

    if (user == "99") {
      text = await getResponse(text);
      text = text != null ? text : "Sorry, this cannot be processed.";
    }

    ChatItemModel message = ChatItemModel(
      senderId: user,
      message: text,
    );

    if (user != "99") {
      setState(() {
        isLoading = true;
        chatItems.add(message);
      });
      //Add animation via a post frame callback
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
        );
      });
      _handleSubmitted(text, "99");
    } else {
      await playback(text);
      setState(() {
        isLoading = false;
        chatItems.add(message);
      });
      //Add animation via a post frame callback
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: kPrimaryBlack,
      appBar: AppBar(
        backgroundColor: kPrimaryBlack,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kAccentColor,
          ),
          onPressed: () => Navigator.pushNamed(context, LandingPage.id),
        ),
        title: Text("Waifu A.I."),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                controller: _scrollController,
                itemCount: chatItems.length,
                //reverse: true,
                itemBuilder: (context, index) {
                  return Row(
                      mainAxisAlignment:
                          chatItems[index].senderId == currentUser
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                      children: <Widget>[
                        //* USE THIS CONTAINER FOR AN AVATAR PICTURE
                        // Container(
                        //   width: 25,
                        //   height: 25,
                        //   /* decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //       image: ExactAssetImage(
                        //         "",
                        //       ),
                        //     ),
                        //   ), */
                        // ),
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * .7,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 12,
                          ),
                          margin: EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: chatItems[index].senderId == currentUser
                                ? kAccentColor
                                : kAccentGrey,
                          ),
                          child: Text(
                            "${chatItems[index].message}",
                            style: TextStyle(
                              color: chatItems[index].senderId == currentUser
                                ? kAccentGrey
                                : kPrimaryWhite,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ]);
                }),
          ),
          isLoading
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      SpinKitThreeBounce(
                        color: kAccentColor,
                        size: 15.0,
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(12),
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: BoxDecoration(
          color: kAccentDarkGrey,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(20.0),
                  hintText: "Type something...",
                  hintStyle: TextStyle(
                    color: kAccentGrey,
                  ),
                ),
                style: TextStyle(
                  color: kPrimaryWhite,
                ),
                controller: _textController,

                //Prevent Empty Input
                //One simple null check to rule them all
                onSubmitted: (t) =>
                    t != "" ? _handleSubmitted(t, currentUser) : {},
                onChanged: (value) {
                  reply = value;
                },
              ),
            ),
            IconButton(
              icon: Icon(
                LineAwesomeIcons.paper_plane,
                color: kAccentColor,
              ),
              onPressed: () {
                SystemChannels.textInput.invokeMethod('TextInput.hide');
                // ignore: unnecessary_statements
                reply != '' ? _handleSubmitted(reply, currentUser) : {};
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ChatItemModel {
  String senderId;
  String message;
  ChatItemModel({this.senderId, this.message});
}
