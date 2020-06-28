import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
  List<ChatItemModel> chatItems = [
    ChatItemModel(
      senderId: "1",
      message: "Hello",
    ),
    ChatItemModel(
      senderId: "99",
      message: "Hello hey i'm 2",
    ),
  ];

  void _handleSubmitted(String text, String user) async {
    _textController.clear();

    if (user == "99") {
      text = await getResponse(text);
    }

    ChatItemModel message = ChatItemModel(
      senderId: user,
      message: text,
    );

    if (user != "99") {
      setState(() {
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
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.blueColor,
          ),
          onPressed: () => Navigator.pushNamed(context, LandingPage.id),
        ),
        title: Text("Waifu A.I."),
        centerTitle: true,
      ),
      body: ListView.builder(
          controller: _scrollController,
          itemCount: chatItems.length,
          //reverse: true,
          itemBuilder: (context, index) {
            return Row(
                mainAxisAlignment: chatItems[index].senderId == currentUser
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 25,
                    height: 25,
                    /* decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(
                          "",
                        ),
                      ),
                    ), */
                  ),
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
                          ? AppColors.blueColor
                          : Colors.white38,
                    ),
                    child: Text(
                      "${chatItems[index].message}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ]);
          }),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(12),
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: BoxDecoration(
          color: AppColors.darkColor,
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
                  hintText: "Type something...",
                  hintStyle: TextStyle(
                    color: Colors.white30,
                  ),
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
                controller: _textController,

                //Prevent Empty Input
                //One simple null check to rule them all
                onSubmitted: (t) =>
                    t != "" ? _handleSubmitted(t, currentUser) : {},
              ),
            ),
            IconButton(
              //TODO: ADD ICON TEXTINPUT
              icon: Icon(
                Icons.attach_file,
                color: AppColors.blueColor,
              ),
              onPressed: () {},
            ),
            IconButton(
              //TODO: ADD ICON TEXTINPUT
              icon: Icon(
                LineAwesomeIcons.reddit,
                color: AppColors.blueColor,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class AppColors {
  static Color mainColor = Color(0XFF252331);
  static Color darkColor = Color(0XFF1e1c26);
  static Color blueColor = Color(0XFF2c75fd);
}

class ChatItemModel {
  String senderId;
  String message;
  ChatItemModel({this.senderId, this.message});
}
