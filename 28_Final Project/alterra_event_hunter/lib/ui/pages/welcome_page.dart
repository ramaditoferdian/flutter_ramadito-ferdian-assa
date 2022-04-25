// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:alterra_event_hunter/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 50, left: defaultMargin),
            child: Image.asset(
              'assets/img/event_hunter_logo.png',
              width: 150,
            ),
          ),
          GestureDetector(
            onTap: () {
              print('Next');
            },
            child: Container(
              margin: EdgeInsets.only(top: 50, right: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              // width: 105,
              // height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Next',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: primaryTextColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          header(),
          SizedBox(
            height: 100,
          ),
          Container(
            child: Text(
              'WELCOME TO\nEVENT HUNTER',
              style: secondaryTextStyle.copyWith(
                fontSize: 32,
                fontWeight: bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        // child: Image.asset(
        //   'assets/ilustrasi/welcome_page_ilus.png',
        //   width: double.infinity,
        // ),
        margin: EdgeInsets.only(bottom: 150),
        child: Lottie.asset(
          'assets/ilustrasi/welcome_page_lottie.json',
        ),
      ),
    );
  }
}
