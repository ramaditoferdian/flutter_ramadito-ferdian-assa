// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Clock(),
    );
  }
}

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late String jam;
  late String menit;
  late String detik;
  late Timer _everySecond;

  @override
  void initState() {
    super.initState();

    // sets first value
    jam = DateTime.now().hour.toString();
    menit = DateTime.now().minute.toString();
    detik = DateTime.now().second.toString();

    // defines a timer
    _everySecond = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        jam = DateTime.now().hour.toString();
        menit = DateTime.now().minute.toString();
        detik = DateTime.now().second.toString();

        if (jam.length < 2) {
          jam = "0" + jam;
        }
        if (menit.length < 2) {
          menit = "0" + menit;
        }
        if (detik.length < 2) {
          detik = "0" + detik;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Center(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Text(
            '$jam : $menit : $detik',
            style: GoogleFonts.orbitron(fontSize: 50, wordSpacing: 1),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
