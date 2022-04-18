// ignore_for_file: prefer_const_constructors

import 'package:consume_api/home_page.dart';
import 'package:consume_api/pages/create_contact_page.dart';
import 'package:consume_api/pages/detail_contact_page.dart';
import 'package:consume_api/providers/contact_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ContactProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/create-contact-page': (context) => CreateContactPage(),
          '/detail-contact-page': (context) => DetailContactPage(),
        },
      ),
    );
  }
}
