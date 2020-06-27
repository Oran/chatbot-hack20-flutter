import 'package:flutter/material.dart';
import 'package:hack2020/components/bot_nav_bar.dart';

class SettingsPage extends StatelessWidget {
  static final String id = 'settings_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BotNavBar(),
    ); //TODO: Finish Settings page
  }
}
