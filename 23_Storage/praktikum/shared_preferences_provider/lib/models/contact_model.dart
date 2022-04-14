import 'package:flutter/material.dart';

class ContactModel {
  late final int? id;
  late final String? name;
  late final String? phoneNumber;
  late final int? avatarColor;

  ContactModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.avatarColor,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'avatarColor': avatarColor,
    };
  }

  ContactModel.fromMap(Map map) {
    id = map['id'];
    name = map['name'];
    phoneNumber = map['phoneNumber'];
    avatarColor = map['avatarColor'];
  }

  // factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
  //       id: json['id'],
  //       name: json['name'],
  //       phoneNumber: json['phoneNumber'],
  //       avatarColor: Color(json['avatarColor']),
  //     );
}
