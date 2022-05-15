// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, sized_box_for_whitespace

import 'package:alterra_event_hunter/models/event_model.dart';
import 'package:alterra_event_hunter/providers/event_provider.dart';
import 'package:alterra_event_hunter/ui/pages/detail_event_page.dart';
import 'package:alterra_event_hunter/ui/pages/preview_event_page.dart';
import 'package:alterra_event_hunter/ui/widgets/destination_tile.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ExploreEventPage extends StatefulWidget {
  const ExploreEventPage({Key? key}) : super(key: key);

  @override
  State<ExploreEventPage> createState() => _ExploreEventPageState();
}

class _ExploreEventPageState extends State<ExploreEventPage> {
  @override
  Widget build(BuildContext context) {
    EventProvider eventProvider = Provider.of<EventProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xffFaFaFa),
      body: Container(
        // color: Colors.amber,
        margin: EdgeInsets.fromLTRB(20, 35, 20, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('Back');
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffF4FFFE),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Color(0xff32B0C7),
                      ),
                    ),
                  ),
                  Text(
                    'Explore Event',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 32,
                    height: 32,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                // color: Colors.amber,
                margin: EdgeInsets.only(bottom: 50),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 180 / 260,
                      crossAxisSpacing: 25,
                      mainAxisSpacing: 25,
                      crossAxisCount: 2,
                    ),
                    itemCount: eventProvider.events.length,
                    itemBuilder: (context, index) {
                      EventModel event = eventProvider.events[index];
                      return DestinationTile(
                        imgThumbnail: event.imgThumbnail,
                        name: event.name,
                        price: event.price,
                        onTap: () {
                          print(event.name);

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return DetailEventPage(eventModel: event);
                          //     },
                          //   ),
                          // );
                          Navigator.of(context).push(
                            PageTransition(
                              child: DetailEventPage(eventModel: event),
                              type: PageTransitionType.rightToLeft,
                            ),
                          );
                        },
                        onLongPress: () {
                          print('tekan lama');
                          print(event.name);
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Preview'),
                                content: Container(
                                  height: 290,
                                  child: PreviewEventPage(
                                    eventModel: event,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}





// note : untuk pindah halaman ke detail screen

// Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) {
//                                 return DestinationDetailsScreen(
//                                     destination: destination);
//                               },
//                             ),
//                           );








// note : untuk add new data to List saat menakan tombol
// setState(() {
//                             destinationList.add(
//                               Destination(
//                                 imgThumbnail:
//                                     'https://s3-ap-southeast-1.amazonaws.com/loket-production-sg/images/banner/20220308105648_6226d400419fb.jpg',
//                                 name:
//                                     'Gangga I\'ts Never Easy Tour - YOGYAKARTA',
//                                 price: '125.000',
//                               ),
//                             );
//                           });