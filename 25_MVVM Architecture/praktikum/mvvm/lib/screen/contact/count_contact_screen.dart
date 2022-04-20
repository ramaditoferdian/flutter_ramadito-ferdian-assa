// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mvvm/screen/contact/contact_view_model.dart';
import 'package:provider/provider.dart';

class CountContactScreen extends StatelessWidget {
  const CountContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContactViewModel contactViewModel = Provider.of<ContactViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Count Contact Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Current contact'),
            Text('${contactViewModel.contacts.length}'),
          ],
        ),
      ),
    );
  }
}
