// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';

class PreviewPostPage extends StatelessWidget {
  final File? image;
  final String? publishDate;
  final Color? colorTheme;
  final String? captionText;

  const PreviewPostPage({
    required this.image,
    required this.publishDate,
    required this.colorTheme,
    required this.captionText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.chevron_left),
          )
        ],
        title: Text('Preview Post'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 250,
              width: double.infinity,
              child: Container(
                height: 250,
                width: double.infinity,
                color: Colors.red,
                child: image != null
                    ? Image.file(
                        image!,
                        height: 250,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )
                    : SizedBox(),
              ),
            ),
            Row(
              children: [
                Text(
                  'Published: ${publishDate!}',
                  style: TextStyle(color: Colors.grey),
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Color:',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorTheme,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              captionText!,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
