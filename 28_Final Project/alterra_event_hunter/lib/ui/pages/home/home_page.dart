// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:alterra_event_hunter/providers/auth_provider.dart';
import 'package:alterra_event_hunter/providers/event_provider.dart';
import 'package:alterra_event_hunter/shared/theme.dart';
import 'package:alterra_event_hunter/ui/pages/detail_event_page.dart';
import 'package:alterra_event_hunter/ui/pages/explore_event_page.dart';
import 'package:alterra_event_hunter/ui/pages/loading/home_page_shimmer.dart';
import 'package:alterra_event_hunter/ui/widgets/destination_card_carousel.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      // await Provider.of<EventProvider>(context, listen: false).getEvents();

      await Provider.of<EventProvider>(context, listen: false)
          .getEventsFromAPI();

      await Provider.of<AuthProvider>(context, listen: false).getUserActive();
    });
  }

  @override
  Widget build(BuildContext context) {
    EventProvider eventProvider = Provider.of<EventProvider>(context);
    Widget header() {
      return AppBar(
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(
              defaultMargin,
            ),
            // color: Colors.amber,
            // height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 25,
                  child: Image.asset('assets/img/icon_menu.png'),
                ),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffF4FFFE),
                  ),
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation(25 / 360),
                    child: Icon(
                      Icons.notifications_none,
                      color: primaryColor,
                    ),
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
        child: Text(
          'Where do\nyou want to travel?',
          style: secondaryTextStyle.copyWith(
            fontSize: 32,
            fontWeight: bold,
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
            color: primaryColor,
          ),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Looking another location...',
            hintStyle: secondaryTextStyle.copyWith(
              fontWeight: medium,
            ),
            border: InputBorder.none,
            suffixIcon: IconButton(
              onPressed: () {
                print('CARI');
              },
              icon: Container(
                // width: 60,
                // height: 60,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor,
                ),
                child: Icon(
                  Icons.search,
                  color: whiteColor,
                ),
              ),
            ),
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
            Text(
              'Explore Location',
              style: secondaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: bold,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, '/explore-location');
                Navigator.of(context).push(
                  PageTransition(
                    child: ExploreEventPage(),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
              child: Icon(
                Icons.chevron_right,
                color: primaryColor,
                size: 40,
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
                  color: primaryColor,
                ),
                child: Text(
                  'Jakarta',
                  style: primaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: semiBold,
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
                  color: secondaryColor,
                ),
                child: Text(
                  'Bandung',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: semiBold,
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
                  color: secondaryColor,
                ),
                child: Text(
                  'Surabaya',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: semiBold,
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
                  color: secondaryColor,
                ),
                child: Text(
                  'Semarang',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: semiBold,
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
                  color: secondaryColor,
                ),
                child: Text(
                  'Yogyakarta',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget popularProducts() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                // children: productProvider.products
                //     .map(
                //       (product) => ProductCard(product),
                //     )
                //     .toList(),
                children: [
                  Container(
                    color: Colors.amber,
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(right: 10),
                  ),
                  Container(
                    color: Colors.amber,
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(right: 10),
                  ),
                  Container(
                    color: Colors.amber,
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(right: 10),
                  ),
                  Container(
                    color: Colors.amber,
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(right: 10),
                  ),
                  Container(
                    color: Colors.amber,
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(right: 10),
                  ),
                  Container(
                    color: Colors.amber,
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(right: 10),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget carouselEvent() {
      EventProvider eventProvider = Provider.of<EventProvider>(context);
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: defaultMargin,
        ),
        child: CarouselSlider(
          options: CarouselOptions(
            height: 380,
            autoPlay: true,
            viewportFraction: 0.48,
            enlargeCenterPage: true,
            disableCenter: true,
          ),
          items: eventProvider.events.map(
            (event) {
              return Builder(
                builder: (BuildContext context) {
                  return DestinationCardCarousel(
                    imgThumbnail: event.imgThumbnail,
                    name: event.name,
                    price: event.price,
                    onTap: () {
                      print(event.name);

                      Navigator.of(context).push(
                        PageTransition(
                          child: DetailEventPage(eventModel: event),
                          type: PageTransitionType.rightToLeft,
                        ),
                      );
                    },
                  );
                },
              );
            },
          ).toList(),
        ),
      );
    }

    Widget bodyLoaded() {
      return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          color: whiteColor,
          height: double.infinity,
          child: ListView(
            children: [
              header(),
              ask(),
              search(),
              exploreLocationTitle(),
              categories(),
              carouselEvent(),
            ],
          ),
        ),
      );
    }

    Widget bodyLoading() {
      // return Center(
      //   child: CircularProgressIndicator(),
      // );
      return HomePageShimmer();
    }

    Widget bodyError() {
      return Center(
        child: Text('Gagal Mengambil Data'),
      );
    }

    Widget body(EventProvider eventProvider) {
      final isLoading = eventProvider.eventState == EventState.loading;
      final isError = eventProvider.eventState == EventState.error;

      if (eventProvider.events.isEmpty && isLoading) {
        return bodyLoading();
      }

      if (eventProvider.events.isEmpty && isError) {
        return bodyError();
      }

      return bodyLoaded();
    }

    return Scaffold(
      body: body(eventProvider),
    );
  }
}
