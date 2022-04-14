import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ContactModel extends Equatable {
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

  @override
  List<Object?> get props => [
        id,
        name,
        phoneNumber,
        // avatarColor,
      ];
}

// List<ContactModel> listOfKontak = [];
