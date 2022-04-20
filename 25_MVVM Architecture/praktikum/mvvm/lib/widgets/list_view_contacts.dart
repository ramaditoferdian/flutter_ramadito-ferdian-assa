import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mvvm/model/contact_model.dart';
import 'package:mvvm/screen/contact/contact_view_model.dart';
import 'package:mvvm/widgets/list_tile_contact.dart';

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
    final contactViewModel = Provider.of<ContactViewModel>(context);

    return ListView.builder(
      itemCount: contactViewModel.contacts.length,
      itemBuilder: (context, index) {
        ContactModel contact = contactViewModel.contacts[index];

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
