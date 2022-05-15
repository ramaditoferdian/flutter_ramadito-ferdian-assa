// ignore_for_file: prefer_const_constructors, dead_code

import 'package:alterra_event_hunter/providers/page_provider.dart';
import 'package:alterra_event_hunter/shared/theme.dart';
import 'package:alterra_event_hunter/ui/pages/home/home_page.dart';
import 'package:alterra_event_hunter/ui/pages/home/my_ticket_page.dart';
import 'package:alterra_event_hunter/ui/pages/home/profile_page.dart';
import 'package:alterra_event_hunter/ui/pages/loading/home_page_shimmer.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<PageProvider>(context, listen: false).initialPage();
  }

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
          bottom: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          currentIndex: pageProvider.currentIndex,
          onTap: (value) {
            print(value);
            pageProvider.currentIndex = value;
          },
          backgroundColor: primaryColor,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: pageProvider.currentIndex == 0
                          ? whiteColor
                          : transparentColor,
                    ),
                    child: Image.asset(
                      'assets/img/icon_page_home.png',
                      width: 25,
                      color: pageProvider.currentIndex == 0
                          ? primaryColor
                          : whiteColor,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Home',
                    style: whiteTextStyle.copyWith(
                      fontWeight:
                          pageProvider.currentIndex == 0 ? semiBold : medium,
                    ),
                  ),
                ],
              ),
              label: '',
            ),
            // BottomNavigationBarItem(
            //   icon: Column(
            //     children: [
            //       Container(
            //         padding: EdgeInsets.all(12),
            //         decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           color: pageProvider.currentIndex == 1
            //               ? whiteColor
            //               : transparentColor,
            //         ),
            //         child: Image.asset(
            //           'assets/img/icon_page_tickets.png',
            //           width: 25,
            //           color: pageProvider.currentIndex == 1
            //               ? primaryColor
            //               : whiteColor,
            //         ),
            //       ),
            //       SizedBox(
            //         height: 5,
            //       ),
            //       Text(
            //         'Ticket\'s',
            //         style: whiteTextStyle.copyWith(
            //           fontWeight:
            //               pageProvider.currentIndex == 1 ? semiBold : medium,
            //         ),
            //       ),
            //     ],
            //   ),
            //   label: '',
            // ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: pageProvider.currentIndex == 1
                          ? whiteColor
                          : transparentColor,
                    ),
                    child: Image.asset(
                      'assets/img/icon_page_profile.png',
                      width: 25,
                      color: pageProvider.currentIndex == 1
                          ? primaryColor
                          : whiteColor,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Profile',
                    style: whiteTextStyle.copyWith(
                      fontWeight:
                          pageProvider.currentIndex == 1 ? semiBold : medium,
                    ),
                  ),
                ],
              ),
              label: '',
            ),
          ],
        ),
      );
    }

    Widget body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return HomePage();
          break;

        // case 1:
        //   return MyTicketPage();
        //   break;

        case 1:
          return ProfilePage();
          break;

        default:
          return HomePage();
      }
    }

    return Scaffold(
      // backgroundColor:
      //     pageProvider.currentIndex == 0 ? backgroundColor1 : backgroundColor3,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: body(),
      bottomNavigationBar: Container(
        // height: 120,
        // color: Colors.red,
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: customBottomNav(),
      ),
    );
  }
}
