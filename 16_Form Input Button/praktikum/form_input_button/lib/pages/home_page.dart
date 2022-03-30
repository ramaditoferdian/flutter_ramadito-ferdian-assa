// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_input_button/models/contact.dart';
import 'package:form_input_button/pages/create_new_contact_page.dart';
import 'package:form_input_button/pages/detail_contact_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        centerTitle: true,
      ),
      body: Container(
        child: listOfContact.isNotEmpty
            ? ListView.builder(
                itemCount: listOfContact.length,
                itemBuilder: (context, index) {
                  Contact contact = listOfContact[index];

                  return ListTile(
                    onTap: () {
                      print(contact.name);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailContactPage(contact: contact);
                          },
                        ),
                      );
                    },
                    leading: CircleAvatar(),
                    title: Text(contact.name!),
                    subtitle: Text(contact.phoneNumber!),
                  );
                },
              )
            : Center(
                child: Container(
                  height: 100,
                  child: Text('You don\'t have a contact list'),
                ),
              ),
      ),
      floatingActionButton: Container(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CreateNewContactPage();
                      },
                    ),
                  );
                },
                child: Icon(Icons.add),
              ),
            ), // button second

            // Add more buttons here
          ],
        ),
      ),
    );
  }
}

// setState(() {
//             listOfContact.add(
//               Contact(name: 'D'),
//             );
//           });

// ListTile(
//               leading: CircleAvatar(),
//               title: Text('Dito'),
//               subtitle: Text('Hello World'),
//             ),



// FloatingActionButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) {
//                     return CreateNewContactPage();
//                   },
//                 ),
//               );
//             },
//             child: Icon(Icons.add),
//           // ),