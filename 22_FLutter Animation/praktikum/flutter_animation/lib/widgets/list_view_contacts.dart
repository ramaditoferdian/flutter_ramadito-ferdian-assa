import 'package:flutter/material.dart';
import 'package:flutter_animation/models/contact_model.dart';
import 'package:flutter_animation/widgets/list_tile_contact.dart';

import 'package:provider/provider.dart';

class ListViewContacts extends StatelessWidget {
  final List<ContactModel> contacts;

  const ListViewContacts(
    this.contacts, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        ContactModel contact = contacts[index];

        return ListTileContact(contact);
      },
    );
  }
}
