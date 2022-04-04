// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:practice_provider/providers/contact_provider.dart';
import 'package:practice_provider/widgets/list_view_contacts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ContactProvider contactProvider = Provider.of<ContactProvider>(context);

    Widget fab() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //button first

            Container(
              margin: EdgeInsets.all(10),
              child: FloatingActionButton(
                heroTag: 'btnAdd',
                onPressed: () {
                  Navigator.of(context).pushNamed('/create-contact-page');
                },
                child: Icon(Icons.add),
              ),
            ), // button second

            // Add more buttons here
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        centerTitle: true,
      ),
      body: Container(
        child: contactProvider.contacts.isNotEmpty
            ? ListViewContacts()
            : Center(
                child: SizedBox(
                  height: 100,
                  child: Text('You don\'t have a contact list'),
                ),
              ),
      ),
      floatingActionButton: fab(),
    );
  }
}
