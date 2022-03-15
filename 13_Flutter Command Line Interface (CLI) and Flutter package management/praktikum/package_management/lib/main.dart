// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:badges/badges.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget task1() {
    return Column(
      children: [
        Chip(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          backgroundColor: Colors.deepPurple,
          label: Text(
            'BADGE',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        Badge(
          toAnimate: false,
          shape: BadgeShape.square,
          badgeColor: Colors.deepPurple,
          borderRadius: BorderRadius.circular(18),
          badgeContent: Text(
            'BADGE',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    );
  }

  Widget task2() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  color: Colors.amber,
                  margin: EdgeInsets.all(8),
                  child: BarcodeWidget(
                    barcode: Barcode.qrCode(
                      errorCorrectLevel: BarcodeQRCorrectionLevel.low,
                    ),
                    data: 'Alterra Academy',
                    width: 150,
                    height: 150,
                  ),
                ),
                Text('Alterra Academy')
              ],
            ),
            Column(
              children: [
                Container(
                  color: Colors.amber,
                  margin: EdgeInsets.all(8),
                  child: BarcodeWidget(
                    barcode: Barcode.qrCode(
                      errorCorrectLevel: BarcodeQRCorrectionLevel.low,
                    ),
                    data: 'Flutter Asik',
                    width: 150,
                    height: 150,
                  ),
                ),
                Text('Flutter Asik')
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: [
            Container(
              color: Colors.amber,
              margin: EdgeInsets.all(8),
              child: BarcodeWidget(
                barcode: Barcode.qrCode(
                  errorCorrectLevel: BarcodeQRCorrectionLevel.low,
                ),
                data: 'Ramadito Ferdian Assa',
                width: 150,
                height: 150,
              ),
            ),
            Text('Ramadito Ferdian Assa')
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Package Management'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              task1(),
              SizedBox(
                height: 100,
              ),
              task2(),
            ],
          ),
        ),
      ),
    );
  }
}
