// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ListTileContact extends StatelessWidget {
  final int? id;
  final String? nama;
  final String? nomorTelepon;
  final int? avatarColor;

  const ListTileContact({
    required this.id,
    required this.nama,
    required this.nomorTelepon,
    required this.avatarColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ListTile(
        onTap: () {
          print(nama);
          Navigator.of(context).pushNamed(
            '/detail-contact-screen',
            arguments: id,
          );
        },
        leading: CircleAvatar(
          backgroundColor: Color(avatarColor!),
          radius: 25,
        ),
        title: Text(nama!),
        subtitle: Text(nomorTelepon!),
      ),
    );
  }
}
