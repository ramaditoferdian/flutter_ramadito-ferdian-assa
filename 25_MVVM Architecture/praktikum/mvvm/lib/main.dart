// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mvvm/screen/contact/contact_screen.dart';

import 'package:mvvm/screen/contact/contact_view_model.dart';
import 'package:mvvm/screen/contact/count_contact_screen.dart';
import 'package:mvvm/screen/contact/create_contact_screen.dart';
import 'package:mvvm/screen/contact/detail_contact_screen.dart';

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
          create: (context) => ContactViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/create-contact-screen': (context) => CreateContactScreen(),
          '/detail-contact-screen': (context) => DetailContactScreen(),
          '/count-contact-screen': (context) => CountContactScreen(),
        },
      ),
    );
  }
}
