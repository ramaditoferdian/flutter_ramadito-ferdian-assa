// ignore_for_file: prefer_const_constructors

import 'package:assets_grid_view/detailPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Container> daftarSosmed = [];

  var socmed = [
    {'nama': 'Facebook', 'gambar': 'assets/img/facebook_logo.png'},
    {'nama': 'Youtube', 'gambar': 'assets/img/youtube_logo.png'},
    {'nama': 'Github', 'gambar': 'assets/img/github_logo.png'},
    {'nama': 'Twitter', 'gambar': 'assets/img/twitter_logo.png'},
  ];

  _buatList() async {
    for (var i = 0; i < socmed.length; i++) {
      final socialMedia = socmed[i];
      daftarSosmed.add(
        Container(
          child: Card(
            color: Color(0xffFAFAFA),
            child: Column(
              children: [
                Hero(
                  tag: socialMedia['nama']!,
                  child: Material(
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => DetailPage(
                            socialMedia['nama'],
                            socialMedia['gambar'],
                          ),
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(20),
                        height: 120,
                        child: Image.asset(
                          socialMedia['gambar']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  socialMedia['nama']!,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    _buatList();
    super.initState();
  }

  Widget body() {
    return GridView.count(
      crossAxisCount: 2,
      children: daftarSosmed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 235, 235),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Social Media',
        ),
      ),
      body: body(),
    );
  }
}
