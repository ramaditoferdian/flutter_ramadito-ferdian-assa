// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String urlImg;
  final String nama;
  final String message;
  final String time;

  final bool isGroup;
  final bool ceklis;

  const ChatTile({
    Key? key,
    required this.urlImg,
    required this.nama,
    required this.message,
    required this.ceklis,
    this.isGroup = false,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          color: Colors.grey[100],
          height: 100,
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                // color: Colors.red,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      urlImg,
                    ),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        isGroup ? Icon(Icons.group) : SizedBox(),
                        isGroup ? SizedBox(width: 5) : SizedBox(),
                        Expanded(
                          child: Text(
                            nama,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      message,
                      style: TextStyle(fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ceklis
                      ? Container(
                          child: Icon(
                            Icons.done_all,
                            size: 22,
                            color: Colors.lightGreen,
                          ),
                        )
                      : SizedBox(
                          width: 22,
                        ),
                ],
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(time),
                  !ceklis
                      ? Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            '2',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.lightGreen,
                            shape: BoxShape.circle,
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            ' ',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey[300],
        ),
      ],
    );
  }
}
