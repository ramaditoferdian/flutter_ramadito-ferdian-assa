// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_tele/widgets/chat_tile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const List<Widget> data = [
    ContactsTab(),
    CallsTab(),
    ChatsTab(),
    SettingsTab(),
  ];

  Widget tabAndBody() {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: "Contacts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: "Calls",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings_solid),
            label: "Settings",
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return data[index];
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Container(
          margin: EdgeInsets.only(top: 12),
          child: Text(
            'Edit',
            style: TextStyle(color: Colors.blue),
          ),
        ),
        middle: Text(
          'Chats',
        ),
        trailing: Icon(CupertinoIcons.pencil_ellipsis_rectangle),
      ),
      child: tabAndBody(),
    );
  }
}

class ContactsTab extends StatelessWidget {
  const ContactsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Contacts Tab'),
      ),
    );
  }
}

class CallsTab extends StatelessWidget {
  const CallsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Calls Tab'),
      ),
    );
  }
}

class ChatsTab extends StatelessWidget {
  const ChatsTab({Key? key}) : super(key: key);

  Widget body() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 60),
            padding: EdgeInsets.symmetric(
              vertical: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[300],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Search',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 0),
            color: Colors.grey[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'All Chats',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Work',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Unread',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Personal',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                color: Colors.transparent,
                width: 50,
                height: 5,
              ),
              Container(
                color: Colors.transparent,
                width: 50,
                height: 5,
              ),
              Container(
                color: Colors.blue,
                width: 50,
                height: 5,
              ),
              Container(
                color: Colors.transparent,
                width: 50,
                height: 5,
              ),
            ],
          ),
          Divider(
            thickness: 2,
            height: 0,
          ),
          // Container(
          //   color: Colors.red,
          //   height: 100,
          // ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                // scrollDirection: Axis.horizontal,
                // physics: ClampingScrollPhysics(),
                // shrinkWrap: false,
                children: <Widget>[
                  ChatTile(
                    urlImg:
                        'https://www.pinclipart.com/picdir/big/133-1331433_free-user-avatar-icons-happy-flat-design-png.png',
                    nama: 'Dito',
                    message: 'Hello World',
                    ceklis: true,
                    time: '20.09',
                  ),
                  ChatTile(
                    urlImg:
                        'https://cdn0.iconfinder.com/data/icons/superuser-web-kit/512/686912-users_people_men_humans_heads_persons-512.png',
                    nama: 'S1 Informatika',
                    message: 'Hai',
                    ceklis: false,
                    time: '20.09',
                    isGroup: true,
                  ),
                  ChatTile(
                    urlImg:
                        'https://www.pinclipart.com/picdir/big/133-1331433_free-user-avatar-icons-happy-flat-design-png.png',
                    nama: 'Dito',
                    message: 'Hello World',
                    ceklis: true,
                    time: '20.09',
                  ),
                  ChatTile(
                    urlImg:
                        'https://cdn0.iconfinder.com/data/icons/superuser-web-kit/512/686912-users_people_men_humans_heads_persons-512.png',
                    nama: 'S1 Informatika',
                    message: 'Hai',
                    ceklis: false,
                    time: '20.09',
                    isGroup: true,
                  ),
                  ChatTile(
                    urlImg:
                        'https://www.pinclipart.com/picdir/big/133-1331433_free-user-avatar-icons-happy-flat-design-png.png',
                    nama: 'Dito',
                    message: 'Hello World',
                    ceklis: true,
                    time: '20.09',
                  ),
                  ChatTile(
                    urlImg:
                        'https://cdn0.iconfinder.com/data/icons/superuser-web-kit/512/686912-users_people_men_humans_heads_persons-512.png',
                    nama: 'S1 Informatika',
                    message: 'Hai',
                    ceklis: false,
                    time: '20.09',
                    isGroup: true,
                  ),
                  ChatTile(
                    urlImg:
                        'https://www.pinclipart.com/picdir/big/133-1331433_free-user-avatar-icons-happy-flat-design-png.png',
                    nama: 'Dito',
                    message: 'Hello World',
                    ceklis: true,
                    time: '20.09',
                  ),
                  ChatTile(
                    urlImg:
                        'https://cdn0.iconfinder.com/data/icons/superuser-web-kit/512/686912-users_people_men_humans_heads_persons-512.png',
                    nama: 'S1 Informatika',
                    message: 'Hai',
                    ceklis: false,
                    time: '20.09',
                    isGroup: true,
                  ),
                  ChatTile(
                    urlImg:
                        'https://www.pinclipart.com/picdir/big/133-1331433_free-user-avatar-icons-happy-flat-design-png.png',
                    nama: 'Dito',
                    message: 'Hello World',
                    ceklis: true,
                    time: '20.09',
                  ),
                  ChatTile(
                    urlImg:
                        'https://cdn0.iconfinder.com/data/icons/superuser-web-kit/512/686912-users_people_men_humans_heads_persons-512.png',
                    nama: 'S1 Informatika',
                    message: 'Hai',
                    ceklis: false,
                    time: '20.09',
                    isGroup: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return body();
  }
}

class SettingsTab extends StatelessWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Settings Tab'),
      ),
    );
  }
}
