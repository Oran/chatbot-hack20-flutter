import 'package:flutter/material.dart';
import 'package:hack2020/screens/chat_page.dart';
import 'package:hack2020/screens/landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: ChatPage.id,
      routes: {
        LandingPage.id: (context) => LandingPage(),
        ChatPage.id: (context) => ChatPage(),
      },
    );
  }
}
