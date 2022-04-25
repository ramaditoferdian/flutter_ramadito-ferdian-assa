import 'package:flutter/material.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Screen'),
      ),
      // body: ListView(
      //   children: [
      //     ListTile(
      //       title: Text('Title'),
      //       subtitle: Text('Subtitle'),
      //     )
      //   ],
      // ),
    );
  }
}
