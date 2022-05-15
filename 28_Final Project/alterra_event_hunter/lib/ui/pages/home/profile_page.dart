// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:alterra_event_hunter/models/user_model.dart';
import 'package:alterra_event_hunter/providers/auth_provider.dart';
import 'package:alterra_event_hunter/providers/page_provider.dart';
import 'package:alterra_event_hunter/shared/theme.dart';
import 'package:alterra_event_hunter/ui/pages/edit_profile_page.dart';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();

    Provider.of<AuthProvider>(context, listen: false).getUserActive();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    UserModel user = authProvider.user;

    handleSignOut() async {
      if (await authProvider.signOut()) {
        // Navigator.pushNamed(context, '/sign-in');
        Navigator.pushNamedAndRemoveUntil(
            context, '/sign-in', (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Gagal Logout',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    }

    Widget header() {
      return AppBar(
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(
              defaultMargin,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: primaryColor,
                  child: Image.asset(
                    'assets/img/icon_profile.png',
                    width: 45,
                    color: Color(0xffF0F0F0),
                  ),
                  radius: 35,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${user.fullName}',
                        style: secondaryTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: bold,
                        ),
                      ),
                      Text(
                        '${user.email}',
                        style: mainTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, '/sign-in', (route) => false);
                    handleSignOut();
                    print('LOGOUT');
                  },
                  child: Image.asset(
                    'assets/img/button_exit.png',
                    width: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget menuItem(IconData ikon, String txt) {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  ikon,
                  color: subtitleColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  txt,
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.chevron_right,
              color: subtitleColor,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: whiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Account',
                style: secondaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('edit profile');

                  // Navigator.pushNamed(context, '/edit-profile-page');

                  Navigator.of(context).push(
                    PageTransition(
                      child: EditProfilePage(),
                      type: PageTransitionType.rightToLeft,
                    ),
                  );
                },
                child: menuItem(Icons.edit, "Edit Profile"),
              ),
              // menuItem(Icons.list_alt, "Your Orders"),
              GestureDetector(
                onTap: () {
                  print('help');

                  // Navigator.pushNamed(context, '/edit-profile-page');
                },
                child: menuItem(Icons.help, "Help"),
              ),
              SizedBox(
                height: 30,
              ),
              // Text(
              //   'General',
              //   style: secondaryTextStyle.copyWith(
              //     fontSize: 16,
              //     fontWeight: bold,
              //   ),
              // ),
              // menuItem(Icons.privacy_tip, "Privacy & Policy"),
              // menuItem(Icons.my_library_books_outlined, "Term of Service"),
              // menuItem(Icons.star, "Rate App"),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
