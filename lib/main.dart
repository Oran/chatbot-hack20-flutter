import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:hack2020/screens/chat_page.dart';
import 'package:hack2020/screens/landing_page.dart';
import 'package:hack2020/screens/onboarding_page.dart';
import 'package:hack2020/screens/settings_page/settings_page.dart';
import 'package:hack2020/screens/settings_page/voice_selection_page.dart';
import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset('settings');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: landingPageID,
      routes: {
        onboardingPageID: (context) => OnboardingPage(),
        landingPageID: (context) => LandingPage(),
        chatPageID: (context) => ChatPage(),
        settingsPageID: (context) => SettingsPage(),
        voiceSelectionPageID: (context) => VoiceSelectionPage(),
      },
    );
  }
}
