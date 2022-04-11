import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ContactModel extends Equatable {
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

  @override
  List<Object?> get props => [id, name, phoneNumber, avatarColor];
}

// List<ContactModel> listOfKontak = [];
