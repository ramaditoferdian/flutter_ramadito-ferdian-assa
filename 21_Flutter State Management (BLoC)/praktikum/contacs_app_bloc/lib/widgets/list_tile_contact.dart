// ignore_for_file: prefer_const_constructors

import 'package:contacs_app_bloc/models/contact_model.dart';
import 'package:contacs_app_bloc/pages/detail_contact_page.dart';
import 'package:flutter/material.dart';

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
