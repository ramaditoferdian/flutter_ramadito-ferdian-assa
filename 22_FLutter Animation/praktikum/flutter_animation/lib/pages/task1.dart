// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Task1 extends StatefulWidget {
  const Task1({Key? key}) : super(key: key);

  @override
  State<Task1> createState() => _Task1State();
}

class _Task1State extends State<Task1> {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task 1'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              clicked = !clicked;
            });
          },
          child: AnimatedContainer(
            duration: Duration(seconds: 2),
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                  image: NetworkImage(
                      'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpapertag.com%2Fwallpaper%2Ffull%2F2%2Ff%2Fe%2F519365-large-japanese-scenery-wallpaper-2048x1401.jpg&f=1&nofb=1'),
                  fit: BoxFit.cover),
            ),
            height: clicked ? 400 : 200,
            width: clicked ? 400 : 200,
            curve: Curves.fastOutSlowIn,
          ),
        ),
      ),
    );
  }
}
