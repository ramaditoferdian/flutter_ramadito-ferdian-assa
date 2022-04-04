import 'dart:math';

import 'package:flutter/material.dart';
import 'package:practice_provider/models/contact_model.dart';
import "package:collection/collection.dart";

class ContactProvider with ChangeNotifier {
  final List<ContactModel> _contacts = List.generate(5, (index) {
    final _random = Random();
    return ContactModel(
        id: index + 1,
        name: 'Contact ${index + 1}',
        phoneNumber: '08123${Random().nextInt(1000000).toInt()}',
        avatarColor:
            Colors.primaries[_random.nextInt(Colors.primaries.length)]);
  });

  List<ContactModel> get contacts => _contacts;

  void addNewContact(ContactModel newContact) {
    _contacts.add(newContact);
    notifyListeners();
  }

  void sortingContact() {
    _contacts.sort(((a, b) {
      return compareAsciiUpperCase(a.name ?? '', b.name ?? '');
    }));
    notifyListeners();
  }
}
