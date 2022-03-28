// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dialog_bottom_sheet/models/destination.dart';
import 'package:dialog_bottom_sheet/screens/destination_detail_screen.dart';
import 'package:dialog_bottom_sheet/widgets/destination_tile.dart';
import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
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
                    itemCount: destinationList.length,
                    itemBuilder: (context, index) {
                      Destination destination = destinationList[index];
                      return DestinationTile(
                        imgThumbnail: destination.imgThumbnail,
                        name: destination.name,
                        price: destination.price,
                        onTap: () {
                          print(destination.name);
                          showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                                bottom: Radius.circular(20),
                              ),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 300,
                                child: DestinationDetailsScreen(
                                  destination: destination,
                                ),
                              );
                            },
                          );
                        },
                        onLongPress: () {
                          print('tekan lama');
                          print(destination.name);
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Preview'),
                                content: Container(
                                  height: 290,
                                  child: DestinationDetailsScreen(
                                      destination: destination),
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