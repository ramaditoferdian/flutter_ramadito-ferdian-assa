import 'dart:convert';

import 'package:consume_api/models/contact_model.dart';
import 'package:consume_api/providers/contact_provider.dart';
import 'package:consume_api/widgets/list_tile_contact.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListViewContacts extends StatefulWidget {
  const ListViewContacts({Key? key}) : super(key: key);

  @override
  State<ListViewContacts> createState() => _ListViewContactsState();
}

class _ListViewContactsState extends State<ListViewContacts> {
  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context);

    return ListView.builder(
      itemCount: contactProvider.contacts.length,
      itemBuilder: (context, index) {
        ContactModel contact = contactProvider.contacts[index];

        return ListTileContact(
          id: contact.id,
          nama: contact.name,
          nomorTelepon: contact.phoneNumber,
          // avatarColor: contact.avatarColor,
          avatarColor: contact.avatarColor,
        );
      },
    );
  }
}
