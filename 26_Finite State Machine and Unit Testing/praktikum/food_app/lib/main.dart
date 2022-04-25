// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_app/screen/food/food_screen.dart';
import 'package:food_app/screen/food/food_view_model.dart';
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
          create: (context) => FoodViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => FoodScreen(),
        },
      ),
    );
  }
}
