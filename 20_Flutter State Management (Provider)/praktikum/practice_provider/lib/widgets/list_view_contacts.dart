import 'package:flutter/material.dart';
import 'package:practice_provider/models/contact_model.dart';
import 'package:practice_provider/pages/detail_contact_page.dart';
import 'package:practice_provider/providers/contact_provider.dart';
import 'package:practice_provider/widgets/list_tile_contact.dart';
import 'package:provider/provider.dart';

class ListViewContacts extends StatelessWidget {
  const ListViewContacts({Key? key}) : super(key: key);

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
          avatarColor: contact.avatarColor,
        );
      },
    );
  }
}
