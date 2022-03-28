import 'package:flutter/material.dart';

class Contact {
  final String? name;
  final String? phoneNumber;

  Contact({
    required this.name,
    required this.phoneNumber,
  });
}

List<Contact> listOfContact = [
  Contact(name: 'Amin', phoneNumber: '08123456789'),
  Contact(name: 'Boma', phoneNumber: '08321456987'),
  Contact(name: 'Cinta', phoneNumber: '08987456123'),
  Contact(name: 'Douma', phoneNumber: '08979465132'),
];
