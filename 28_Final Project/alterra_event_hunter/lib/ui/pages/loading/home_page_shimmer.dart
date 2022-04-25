import 'package:alterra_event_hunter/providers/event_provider.dart';
import 'package:alterra_event_hunter/shared/theme.dart';
import 'package:alterra_event_hunter/ui/pages/detail_event_page.dart';
import 'package:alterra_event_hunter/ui/widgets/destination_card_carousel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomePageShimmer extends StatelessWidget {
  const HomePageShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            // padding: EdgeInsets.all(
            //   defaultMargin,
            // ),
            margin: EdgeInsets.all(defaultMargin),
            // color: Colors.amber,
            // height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 25,
                  color: transparentColor,
                ),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: transparentColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget ask() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: 15,
        ),
        color: whiteColor,
        child: Text(
          'Where do\nyou want to travel?',
          style: secondaryTextStyle.copyWith(
            fontSize: 32,
            fontWeight: bold,
            color: transparentColor,
          ),
        ),
      );
    }

    Widget search() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        padding: EdgeInsets.only(left: 15, top: 0, right: 5, bottom: 0),
        // height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              width: 1.5,
              color: whiteColor,
            ),
            color: whiteColor),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Looking another location...',
            hintStyle: secondaryTextStyle.copyWith(
              fontWeight: medium,
              color: transparentColor,
            ),
            border: InputBorder.none,
          ),
        ),
      );
    }

    Widget exploreLocationTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: 15,
          right: defaultMargin,
          left: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: whiteColor,
              child: Text(
                'Explore Location',
                style: secondaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                  color: transparentColor,
                ),
              ),
            ),
            Container(
              color: whiteColor,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/explore-location');
                },
                child: Icon(
                  Icons.chevron_right,
                  color: transparentColor,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 5,
                ),
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: whiteColor,
                ),
                child: Text(
                  'Jakarta',
                  style: primaryTextStyle.copyWith(
                      fontSize: 13, fontWeight: semiBold, color: whiteColor),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 5,
                ),
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: whiteColor,
                ),
                child: Text(
                  'Bandung',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: semiBold,
                    color: transparentColor,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 5,
                ),
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: whiteColor,
                ),
                child: Text(
                  'Surabaya',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: semiBold,
                    color: transparentColor,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 5,
                ),
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: whiteColor,
                ),
                child: Text(
                  'Semarang',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: semiBold,
                    color: transparentColor,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 5,
                ),
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: whiteColor,
                ),
                child: Text(
                  'Yogyakarta',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: semiBold,
                    color: transparentColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget carouselEvent() {
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: defaultMargin,
        ),
        child: CarouselSlider(
          options: CarouselOptions(
            height: 350,
            autoPlay: false,
            viewportFraction: 0.48,
            enlargeCenterPage: true,
            disableCenter: true,
          ),
          items: [1, 2, 3, 4, 5].map(
            (event) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: 220,
                    color: whiteColor,
                  );
                },
              );
            },
          ).toList(),
        ),
      );
    }

    Widget bodyLoaded() {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Container(
            // color: whiteColor,
            height: double.infinity,
            child: ListView(
              children: [
                header(),
                SizedBox(
                  height: 20,
                ),
                ask(),
                search(),
                exploreLocationTitle(),
                categories(),
                carouselEvent(),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: bodyLoaded(),
    );
  }
}
