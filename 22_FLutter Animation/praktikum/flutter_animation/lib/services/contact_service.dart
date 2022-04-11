import 'package:flutter/material.dart';

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
      List<ContactModel> contacts = listOfKontak;

      return contacts;
    } catch (e) {
      throw e;
    }
  }

  Future<List<ContactModel>> addKontakBaru(ContactModel newKontak) async {
    try {
      listOfKontak.add(newKontak);

      return listOfKontak;
    } catch (e) {
      throw (e);
    }
  }
}

final List<ContactModel> listOfKontak = [
  ContactModel(
      id: 1, name: 'Satu', phoneNumber: '12345678', avatarColor: Colors.red),
  ContactModel(
      id: 2, name: 'Dua', phoneNumber: '12345678', avatarColor: Colors.blue),
  ContactModel(
      id: 3, name: 'Tiga', phoneNumber: '12345678', avatarColor: Colors.yellow),
  ContactModel(
      id: 4, name: 'Empat', phoneNumber: '12345678', avatarColor: Colors.green),
];
