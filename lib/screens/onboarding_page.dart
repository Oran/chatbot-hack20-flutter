import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack2020/components/op_data.dart';
import 'package:hack2020/constants.dart';

class OnboardingPage extends StatefulWidget {
  static final String id = 'onboarding_page';

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  List<SliderModel> slides = List<SliderModel>();
  int currentSliderIndex = 0;

  @override
  void initState() {
    super.initState();
    slides = getSlides();
  }

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? kAccentColor : kAccentDarkGrey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBlack,
      body: GlowingOverscrollIndicator(
        color: kAccentColor,
        axisDirection: AxisDirection.right,
        child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              currentSliderIndex = value;
            });
          },
          itemCount: slides.length,
          itemBuilder: (context, index) {
            return SliderTile(
              text: slides[index].getText(),
              imageAssetPath: slides[index].getImageAssetPath(),
            );
          },
        ),
      ),
      bottomSheet: currentSliderIndex != slides.length - 1
          ? Container(
              color: kPrimaryBlack,
              height: 50.0,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentSliderIndex = 2;
                      });
                    },
                    child: Text(
                      'Skip',
                      style: GoogleFonts.pressStart2p(color: kAccentColor),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      for (int i = 0; i < slides.length; i++)
                        currentSliderIndex == i
                            ? pageIndexIndicator(true)
                            : pageIndexIndicator(false),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      // setState(() {
                      //   currentSliderIndex + 1;
                      // });
                    },
                    child: Text(
                      '    ',
                      style: GoogleFonts.pressStart2p(color: kAccentColor),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              alignment: Alignment.center,
              color: kPrimaryBlack,
              height: 50.0,
              width: (MediaQuery.of(context).size.width),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Get Started',
                style: GoogleFonts.pressStart2p(color: kAccentColor),
              ),
            ),
    );
  }
}

class SliderTile extends StatelessWidget {
  SliderTile({this.text, this.imageAssetPath});

  final String text;
  final String imageAssetPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryBlack,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Image.asset(
              imageAssetPath,
              // width: (MediaQuery.of(context).size.width),
              // height: (MediaQuery.of(context).size.height),
            ),
          ),
          // Text(
          //   text,
          //   style:
          //       GoogleFonts.pressStart2p(color: kAccentColor, fontSize: 40.0),
          // ),
        ],
      ),
    );
  }
}
