import 'package:flutter/material.dart';

class ContactModel {
  final int? id;
  final String? name;
  final String? phoneNumber;
  final Color? avatarColor;

  ContactModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.avatarColor,
  });
}
