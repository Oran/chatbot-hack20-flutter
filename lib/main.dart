import 'package:flutter/material.dart';
import 'package:hack2020/screens/chat_page.dart';
import 'package:hack2020/screens/landing_page.dart';
import 'package:hack2020/screens/settings_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LandingPage.id,
      routes: {
        LandingPage.id: (context) => LandingPage(),
        ChatPage.id: (context) => ChatPage(),
        SettingsPage.id: (context) => SettingsPage(),
      },
    );
  }
}
