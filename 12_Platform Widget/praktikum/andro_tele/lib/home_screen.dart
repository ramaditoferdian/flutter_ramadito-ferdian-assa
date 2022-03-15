// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:andro_tele/widgets/chat_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar customAppBar() {
      return AppBar(
        backgroundColor: const Color(
          0xff59779A,
        ),
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              print('menu');
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu),
          );
        }),
        title: Text('Telegram'),
        actions: [
          IconButton(
            onPressed: () {
              print('search');
            },
            icon: Icon(Icons.search),
          ),
        ],
      );
    }

    Widget customDrawer() {
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn.dribbble.com/users/2364329/screenshots/5930135/aa.jpg'),
              ),
              accountName: Text(
                'Ramadito Ferdian Assa',
                style: TextStyle(fontSize: 20),
              ),
              accountEmail: Text('+62 8966 3939 494'),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'http://www.hdwallpaperspulse.com/wp-content/uploads/2017/02/02/widescreen-hd-dark-forest-image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text(
                'New Group',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text(
                'New Secret Chat',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.campaign),
              title: const Text(
                'New Channel',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              leading: const Icon(Icons.contacts),
              title: const Text(
                'Contacts',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.person_add),
              title: const Text(
                'Invite Friends',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(
                'Settings',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text(
                'Telegram FAQ',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: customAppBar(),
      drawer: customDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ChatTile(
              urlImg:
                  'https://cdn4.iconfinder.com/data/icons/avatar-1-2/100/Avatar-16-512.png',
              nama: 'Press Room',
              message: 'Whats up!!!!!',
              ceklis: false,
              time: '3.29 PM',
              isGroup: true,
            ),
            ChatTile(
              urlImg:
                  'https://cdn.dribbble.com/users/2364329/screenshots/5930135/aa.jpg',
              nama: 'Ramadito Ferdian Assa',
              message: 'Hello World',
              ceklis: true,
              time: '5.54 PM',
            ),
            ChatTile(
              urlImg:
                  'https://cdn1.vectorstock.com/i/1000x1000/31/95/user-sign-icon-person-symbol-human-avatar-vector-12693195.jpg',
              nama: 'Alex',
              message: 'haiiissssssssssssssssssssssssssssssssssssssssss',
              ceklis: false,
              time: '8.29 PM',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('add chat');
        },
        backgroundColor: Color(0xff59779A),
        child: Icon(
          Icons.create,
        ),
      ),
    );
  }
}
