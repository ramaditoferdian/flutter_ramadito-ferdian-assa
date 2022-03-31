// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_navigation/pages/create_new_contact_page.dart';
import 'package:flutter_navigation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/create-contact-page': (context) => CreateNewContactPage(),
      },
    );
  }
}
