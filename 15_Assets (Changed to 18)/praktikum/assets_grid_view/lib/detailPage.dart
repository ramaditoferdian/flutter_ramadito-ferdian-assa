import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String? nama;
  final String? gambar;
  const DetailPage(
    this.nama,
    this.gambar, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // width: double.infinity,
              height: 240,
              child: Hero(
                tag: nama!,
                child: Material(
                  child: InkWell(
                    child: Image.asset(
                      gambar!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              nama!,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
