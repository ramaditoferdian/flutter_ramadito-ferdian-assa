// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:consume_api/providers/contact_provider.dart';
import 'package:consume_api/widgets/list_view_contacts.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    // initSharedPreferences();
    super.initState();
    Provider.of<ContactProvider>(context, listen: false).loadData();
  }

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
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                Provider.of<ContactProvider>(context, listen: false)
                    .clearData();

                // contactProvider.contacts.clear();

                // Provider.of<ContactProvider>(context, listen: false).loadData();
              });
            },
            icon: Icon(Icons.clear),
          ),
        ],
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
