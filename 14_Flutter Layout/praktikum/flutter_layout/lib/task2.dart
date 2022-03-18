// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Task2 extends StatelessWidget {
  const Task2({Key? key}) : super(key: key);

  Widget circleIcon({
    required IconData ikon,
  }) {
    return Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(
        ikon,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    for (var i = 0; i < 20; i++) {
      children.add(circleIcon(ikon: Icons.star_border));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GridView',
          style: TextStyle(
            fontSize: 30,
            backgroundColor: Colors.grey.withOpacity(0.8),
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: children,
      ),
    );
  }
}
