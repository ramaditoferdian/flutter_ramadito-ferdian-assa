// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:alterra_event_hunter/shared/theme.dart';
import 'package:alterra_event_hunter/utils/format_currency.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DestinationCardCarousel extends StatelessWidget {
  final String? imgThumbnail;
  final String? name;
  final int? price;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;
  const DestinationCardCarousel({
    required this.imgThumbnail,
    required this.name,
    required this.price,
    this.onTap,
    this.onLongPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 220,
      decoration: BoxDecoration(
        color: whiteColor,
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
      child: GestureDetector(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 300,
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
                    FormatCurrency().formatRupiah(price!),
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
