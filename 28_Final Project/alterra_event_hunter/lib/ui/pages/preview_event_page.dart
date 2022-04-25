import 'package:alterra_event_hunter/models/event_model.dart';
import 'package:flutter/material.dart';

class PreviewEventPage extends StatelessWidget {
  final EventModel eventModel;
  const PreviewEventPage({
    required this.eventModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          children: [
            Container(
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(
                    eventModel.imgThumbnail!,
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
                    eventModel.name!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text('Starting from'),
                  Text(
                    'Rp ${eventModel.price!}',
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
