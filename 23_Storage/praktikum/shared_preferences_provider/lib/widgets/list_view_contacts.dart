import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_provider/models/contact_model.dart';
import 'package:shared_preferences_provider/providers/contact_provider.dart';
import 'package:shared_preferences_provider/widgets/list_tile_contact.dart';

class ListViewContacts extends StatefulWidget {
  const ListViewContacts({Key? key}) : super(key: key);

  @override
  State<ListViewContacts> createState() => _ListViewContactsState();
}

class _ListViewContactsState extends State<ListViewContacts> {
  // List<ContactModel>? listContactModel = [];

  // late SharedPreferences sharedPreferences;

  // @override
  // void initState() {
  //   initSharedPreferences();
  //   super.initState();
  // }

  // initSharedPreferences() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   loadData();
  // }

  // void loadData() {
  //   List<String>? stringList = sharedPreferences.getStringList('myContact');

  //   int? counter = sharedPreferences.getInt('counter');

  //   listContactModel =
  //       stringList?.map((e) => ContactModel.fromMap(json.decode(e))).toList();

  //   print('ini angka counter $counter');

  //   // print('print disini');
  //   // for (var item in listContactModel!) {
  //   //   print(item.name);
  //   // }
  //   // // print(listContactModel![0].name);
  //   // print(stringList);

  //   setState(() {});
  // }

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
