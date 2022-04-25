// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:alterra_event_hunter/models/user_model.dart';
import 'package:alterra_event_hunter/providers/auth_provider.dart';
import 'package:alterra_event_hunter/providers/event_provider.dart';
import 'package:alterra_event_hunter/providers/page_provider.dart';
import 'package:alterra_event_hunter/ui/pages/explore_event_page.dart';
import 'package:alterra_event_hunter/ui/pages/home/main_page.dart';
import 'package:alterra_event_hunter/ui/pages/home/profile_page.dart';
import 'package:alterra_event_hunter/ui/pages/sign_in_page.dart';
import 'package:alterra_event_hunter/ui/pages/sign_up_page.dart';
import 'package:alterra_event_hunter/ui/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var user = prefs.getString('userSaved');
  var userNow;
  if (user != null) {
    var getUser = UserModel.fromJson(json.decode(user));
    userNow = getUser;
  }

  runApp(MyApp(
    // initialRoute: user == null ? '/sign-in' : '/home',
    initialRoute: user == null
        ? '/sign-in'
        : (userNow.role == 'Customer' ? '/home' : '/profile-page'),
  ));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({required this.initialRoute, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EventProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: '/sign-in',
        initialRoute: initialRoute,
        routes: {
          // '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/explore-location': (context) => ExploreEventPage(),
          '/profile-page': (context) => ProfilePage(),
        },
      ),
    );
  }
}
