import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences_bloc/models/contact_model.dart';
import 'package:shared_preferences_bloc/widgets/list_tile_contact.dart';

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
