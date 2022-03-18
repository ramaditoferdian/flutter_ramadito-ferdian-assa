// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Task1 extends StatelessWidget {
  const Task1({Key? key}) : super(key: key);

  Widget imgProfile({required String img}) {
    return Container(
      width: 80,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(right: 10),
      child: Text(
        'A',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
        textAlign: TextAlign.center,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.lightGreen,
      ),
    );
  }

  Widget nameAndText({
    required String nama,
    required String text,
  }) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              nama,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }

  Widget chatTile({
    required String gambar,
    required String nama,
    required String text,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12.withOpacity(0.05),
          ),
        ),
      ),
      height: 100,
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imgProfile(img: gambar),
          nameAndText(nama: nama, text: text),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'JSON ListView in Flutter',
        ),
      ),
      body: ListView(
        children: [
          chatTile(gambar: 'A', nama: 'Amin', text: 'Hello World'),
          chatTile(gambar: 'B', nama: 'Bmin', text: 'Hello World'),
          chatTile(gambar: 'C', nama: 'Cmin', text: 'Hello World'),
          chatTile(gambar: 'D', nama: 'Dmin', text: 'Hello World'),
          chatTile(gambar: 'E', nama: 'Emin', text: 'Hello World'),
          chatTile(gambar: 'F', nama: 'Fmin', text: 'Hello World'),
          chatTile(gambar: 'G', nama: 'Gmin', text: 'Hello World'),
          chatTile(gambar: 'H', nama: 'Hmin', text: 'Hello World'),
          chatTile(gambar: 'I', nama: 'Imin', text: 'Hello World'),
          chatTile(gambar: 'J', nama: 'Jmin', text: 'Hello World'),
          chatTile(gambar: 'K', nama: 'Kmin', text: 'Hello World'),
          chatTile(gambar: 'L', nama: 'Lmin', text: 'Hello World'),
          chatTile(gambar: 'M', nama: 'Mmin', text: 'Hello World'),
          chatTile(gambar: 'N', nama: 'Nmin', text: 'Hello World'),
          chatTile(gambar: 'O', nama: 'Omin', text: 'Hello World'),
          chatTile(gambar: 'P', nama: 'Pmin', text: 'Hello World'),
        ],
      ),
    );
  }
}
