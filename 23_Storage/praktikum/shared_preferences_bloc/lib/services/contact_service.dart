// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:collection/collection.dart";

import '../models/contact_model.dart';

class ContactService {
  // final List<ContactModel> kontaks = [
  //   ContactModel(
  //       id: 1, name: 'Satu', phoneNumber: '12345678', avatarColor: Colors.red),
  //   ContactModel(
  //       id: 2, name: 'Dua', phoneNumber: '12345678', avatarColor: Colors.blue),
  //   ContactModel(
  //       id: 3,
  //       name: 'Tiga',
  //       phoneNumber: '12345678',
  //       avatarColor: Colors.yellow),
  //   ContactModel(
  //       id: 4,
  //       name: 'Empat',
  //       phoneNumber: '12345678',
  //       avatarColor: Colors.green),
  // ];

  // Future<List<ContactModel>> fetchContacts() async {
  //   try {
  //     List<ContactModel> contacts = kontaks;

  //     return contacts;
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // Future<List<ContactModel>> addKontakBaru(ContactModel newKontak) async {
  //   try {
  //     kontaks.add(newKontak);

  //     return kontaks;
  //   } catch (e) {
  //     throw (e);
  //   }
  // }

  Future<List<ContactModel>> fetchContacts() async {
    try {
      sortingContact();
      List<ContactModel> contacts = listOfKontak;

      return contacts;
    } catch (e) {
      throw e;
    }
  }

  Future<List<ContactModel>> addKontakBaru(ContactModel newKontak) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      listOfKontak.add(newKontak);

      List<String> stringList =
          listOfKontak.map((item) => json.encode(item.toMap())).toList();

      sharedPreferences.setInt('counter', 1);

      // note : Proses save data ke shared preferences
      sharedPreferences.setStringList('myContact', stringList);

      print('CONTACT SAVED');

      sortingContact();

      return listOfKontak;
    } catch (e) {
      throw (e);
    }
  }

  Future<void> loadData() async {
    sortingContact();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? stringList = sharedPreferences.getStringList('myContact');

    int? counter = sharedPreferences.getInt('counter');

    if (stringList != null) {
      listOfKontak =
          stringList.map((e) => ContactModel.fromMap(json.decode(e))).toList();
    }

    print('ini angka counter $counter');
    print('ini isi list : $stringList');
  }

  Future<void> clearData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    // sharedPreferences.remove('myContact');
    sharedPreferences.clear();
    print('Clear Data');
    List<String>? stringList = sharedPreferences.getStringList('myContact');

    if (stringList == null) {
      print('isi list setelah clear : $stringList');
      listOfKontak.clear();
    }
  }
}

void sortingContact() {
  listOfKontak.sort(((a, b) {
    return compareAsciiUpperCase(a.name ?? '', b.name ?? '');
  }));
}

List<ContactModel> listOfKontak = [
  // ContactModel(
  //     id: 1, name: 'Satu', phoneNumber: '12345678', avatarColor: Colors.red),
  // ContactModel(
  //     id: 2, name: 'Dua', phoneNumber: '12345678', avatarColor: Colors.blue),
  // ContactModel(
  //     id: 3, name: 'Tiga', phoneNumber: '12345678', avatarColor: Colors.yellow),
  // ContactModel(
  //     id: 4, name: 'Empat', phoneNumber: '12345678', avatarColor: Colors.green),
];
