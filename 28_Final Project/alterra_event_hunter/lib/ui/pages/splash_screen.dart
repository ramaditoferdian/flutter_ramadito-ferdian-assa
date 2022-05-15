import 'package:alterra_event_hunter/shared/theme.dart';
import 'package:alterra_event_hunter/ui/pages/welcome_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  // void initState() {
  //   // TODO: implement initState

  //   getInit();

  //   super.initState();
  // }

  // getInit() async {
  //   Future.delayed(const Duration(seconds: 2), () async {
  //     Navigator.pushNamed(context, '/welcome-page');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryTextColor,
      body: AnimatedSplashScreen(
        splash: Center(
          child: Container(
            margin: EdgeInsets.only(left: defaultMargin),
            child: Image.asset(
              'assets/img/event_hunter_logo.png',
              width: double.infinity,
            ),
          ),
        ),
        nextScreen: const WelcomePage(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.leftToRight,
      ),
    );
  }
}
