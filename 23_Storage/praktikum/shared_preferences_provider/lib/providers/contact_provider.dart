// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import "package:collection/collection.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_provider/models/contact_model.dart';

class ContactProvider with ChangeNotifier {
  // final List<ContactModel> _contacts = List.generate(5, (index) {
  //   final _random = Random();
  //   return ContactModel(
  //       id: index + 1,
  //       name: 'Contact ${index + 1}',
  //       phoneNumber: '08123${Random().nextInt(1000000).toInt()}',
  //       avatarColor:
  //           Colors.primaries[_random.nextInt(Colors.primaries.length)]);
  // });

  List<ContactModel> _contacts = [];

  List<ContactModel> get contacts => _contacts;

  void addNewContact(ContactModel newContact) {
    _contacts.add(newContact);
    saveData();
    notifyListeners();
  }

  void sortingContact() {
    _contacts.sort(((a, b) {
      return compareAsciiUpperCase(a.name ?? '', b.name ?? '');
    }));
    notifyListeners();
  }

  void saveData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> stringList =
        _contacts.map((item) => json.encode(item.toMap())).toList();

    sharedPreferences.setStringList('myContact', stringList);

    sharedPreferences.setString('status', 'SAVED');
    String? status = sharedPreferences.getString('status');

    print('status : $status');
    print('ini isi list : $stringList');
  }

  void loadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? stringList = sharedPreferences.getStringList('myContact');

    if (stringList != null) {
      _contacts =
          stringList.map((e) => ContactModel.fromMap(json.decode(e))).toList();
    }

    sharedPreferences.setString('status', 'LOADED');
    String? status = sharedPreferences.getString('status');

    print('status : $status');
    print('ini isi list : $stringList');

    notifyListeners();
  }

  void clearData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    // sharedPreferences.remove('myContact');
    sharedPreferences.clear();

    List<String>? stringList = sharedPreferences.getStringList('myContact');

    if (stringList == null) {
      _contacts.clear();
      saveData();
    }

    sharedPreferences.setString('status', 'CLEAR DATA');
    String? status = sharedPreferences.getString('status');

    print('status : $status');
    print('ini isi list : $stringList');

    notifyListeners();
  }
}
