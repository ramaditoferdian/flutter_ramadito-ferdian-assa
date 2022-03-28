// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dialog_bottom_sheet/screens/destination_detail_screen.dart';
import 'package:flutter/material.dart';

class DestinationTile extends StatelessWidget {
  final String? imgThumbnail;
  final String? name;
  final String? price;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;
  const DestinationTile({
    required this.imgThumbnail,
    required this.name,
    required this.price,
    this.onTap,
    this.onLongPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        margin: EdgeInsets.all(5),
        width: 180,
        height: 290,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 2), // changes position of shadow
              //first paramerter of offset is left-right
              //second parameter is top to down
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(
                    imgThumbnail!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              // color: Colors.amber,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text('Starting from'),
                  Text(
                    'Rp ${price!}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
