// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_animation/models/contact_model.dart';
import 'package:flutter_animation/pages/detail_contact_page.dart';

class ListTileContact extends StatelessWidget {
  // final int? id;
  // final String? nama;
  // final String? nomorTelepon;
  // final Color? avatarColor;

  const ListTileContact(
    this.contact, {
    // required this.id,
    // required this.nama,
    // required this.nomorTelepon,
    // required this.avatarColor,
    Key? key,
  }) : super(key: key);

  final ContactModel contact;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ListTile(
        onTap: () {
          print(contact.name);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailContactPage(contact),
            ),
          );
        },
        leading: CircleAvatar(
          backgroundColor: contact.avatarColor,
          radius: 25,
        ),
        title: Text(contact.name!),
        subtitle: Text(contact.phoneNumber!),
      ),
    );
  }
}
