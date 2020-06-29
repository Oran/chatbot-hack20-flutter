import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:waifu.ai/screens/chat_page.dart';
import 'package:waifu.ai/screens/landing_page.dart';
import 'package:waifu.ai/screens/onboarding_page.dart';
import 'package:waifu.ai/screens/settings_page/settings_page.dart';
import 'package:waifu.ai/screens/settings_page/voice_selection_page.dart';
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
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: GlobalConfiguration().getBool('onBoarding') == false
          ? onboardingPageID
          : landingPageID,
      routes: {
        onboardingPageID: (context) => OnboardingPage(),
        landingPageID: (context) => LandingPage(),
        chatPageID: (context) =>
            ChatPage(query: ModalRoute.of(context).settings.arguments),
        settingsPageID: (context) => SettingsPage(),
        voiceSelectionPageID: (context) => VoiceSelectionPage(),
      },
    );
  }
}
