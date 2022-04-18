// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:math';

import 'package:consume_api/models/contact_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import "package:collection/collection.dart";
import 'package:shared_preferences/shared_preferences.dart';

class ContactProvider with ChangeNotifier {
  Random random = Random();

  List<ContactModel> _contacts = [];

  List<ContactModel> get contacts => _contacts;

  void addNewContact(ContactModel newContact) {
    _contacts.add(newContact);
    saveData();
    sortingContact();
    notifyListeners();
  }

  void sortingContact() {
    _contacts.sort(((a, b) {
      return compareAsciiUpperCase(a.name ?? '', b.name ?? '');
    }));
    notifyListeners();
  }

  int generateRandomHexColor() {
    int length = 6;
    String chars = '0123456789ABCDEF';
    String hex = '0xff';
    while (length-- > 0) {
      hex += chars[(random.nextInt(16)) | 0];
    }
    return int.parse(hex);
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
      print('di sini');
      _contacts =
          stringList.map((e) => ContactModel.fromMap(json.decode(e))).toList();
    } else if (stringList == null) {
      print('dari api');
      getDataFromAPI();
    }

    print(stringList == []);

    sharedPreferences.setString('status', 'LOADED');
    String? status = sharedPreferences.getString('status');

    print('status : $status');
    print('ini isi list : $stringList');

    notifyListeners();
  }

  void getDataFromAPI() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    Response<List<dynamic>> response = await Dio().get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/');

    if (response.statusCode == 200) {
      List<ContactModel>? kontak = response.data?.map((item) {
        print(item);
        return ContactModel.fromMap(item);
      }).toList();

      _contacts = kontak!;

      List<String> stringList =
          _contacts.map((item) => json.encode(item.toMap())).toList();

      sharedPreferences.setStringList('myContact', stringList);
    }
    notifyListeners();
  }

  void clearData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.remove('myContact');
    sharedPreferences.clear();

    sharedPreferences = await SharedPreferences.getInstance();
    List<String>? stringList = sharedPreferences.getStringList('myContact');

    if (stringList == null) {
      _contacts.clear();
      // saveData();
    }

    sharedPreferences.setString('status', 'CLEAR DATA');
    String? status = sharedPreferences.getString('status');

    print('status : $status');
    print('ini isi list : $stringList');

    notifyListeners();
  }

  Future<bool> postContact(ContactModel contactModel) async {
    Response response = await Dio().post(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/',
      data: contactModel.toMap(),
    );

    if (response.statusCode == 201) {
      print(response.statusCode);
      print('response data : ${response.data}');
      return true;
    }

    return false;
  }
}
