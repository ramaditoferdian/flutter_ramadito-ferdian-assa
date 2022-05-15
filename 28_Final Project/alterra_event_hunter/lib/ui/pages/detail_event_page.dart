// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:alterra_event_hunter/models/event_model.dart';
import 'package:alterra_event_hunter/shared/theme.dart';
import 'package:alterra_event_hunter/ui/widgets/destination_tile.dart';
import 'package:alterra_event_hunter/utils/format_currency.dart';
import 'package:flutter/material.dart';

class DetailEventPage extends StatefulWidget {
  final EventModel eventModel;
  const DetailEventPage({
    required this.eventModel,
    Key? key,
  }) : super(key: key);

  @override
  State<DetailEventPage> createState() => _DetailEventPageState();
}

class _DetailEventPageState extends State<DetailEventPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Widget temp() {
      return Container(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.eventModel.name}',
                style: secondaryTextStyle.copyWith(
                  fontSize: 22,
                  fontWeight: bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 15),
              Text('Starting from'),
              SizedBox(height: 5),
              Text(
                'Rp ${widget.eventModel.price}',
                style: secondaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 15),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: backgroundColor1,
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  border: Border.all(
                    color: greyColor,
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          controller: null,
                          style: secondaryTextStyle,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Your Full Name',
                            hintStyle: subtitleTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: medium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

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
              mainAxisAlignment: MainAxisAlignment.start,
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
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    child: Text(
                      '${widget.eventModel.name}',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget imageEvent() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        height: 250,
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image(
            image: NetworkImage(widget.eventModel.imgThumbnail!),
            fit: BoxFit.cover,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      );
    }

    Widget location() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.location_on,
            size: 20,
            color: primaryColor,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              '${widget.eventModel.location}',
              style: secondaryTextStyle.copyWith(
                fontSize: 15,
                fontWeight: medium,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      );
    }

    Widget date() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.calendar_month,
            size: 20,
            color: primaryColor,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              '${widget.eventModel.dateStart} - ${widget.eventModel.dateEnd}',
              style: secondaryTextStyle.copyWith(
                fontSize: 15,
                fontWeight: medium,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      );
    }

    Widget time() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.watch_later,
            size: 20,
            color: primaryColor,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              '${widget.eventModel.timeStart} - ${widget.eventModel.timeEnd}',
              style: secondaryTextStyle.copyWith(
                fontSize: 15,
                fontWeight: medium,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      );
    }

    Widget city() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.location_city,
            size: 20,
            color: primaryColor,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              '${widget.eventModel.city}',
              style: secondaryTextStyle.copyWith(
                fontSize: 15,
                fontWeight: medium,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      );
    }

    Widget titleDetails() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          top: 15,
          right: defaultMargin,
        ),
        child: Text(
          'Details',
          style: secondaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: bold,
          ),
        ),
      );
    }

    Widget keteranganEvent() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          top: 10,
          right: defaultMargin,
          bottom: 15,
        ),
        padding: EdgeInsets.all(15),
        // height: 240,
        decoration: BoxDecoration(
          color: greyColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: primaryColor.withOpacity(0.5),
          ),
        ),
        child: Column(
          children: [
            location(),
            SizedBox(height: 10),
            date(),
            SizedBox(height: 10),
            time(),
            SizedBox(height: 10),
            city(),
          ],
        ),
      );
    }

    Widget titleDescription() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Text(
          'Description',
          style: secondaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: bold,
          ),
        ),
      );
    }

    Widget bodyDescription() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          top: 10,
          right: defaultMargin,
        ),
        padding: EdgeInsets.all(15),
        // height: 240,
        decoration: BoxDecoration(
          color: greyColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: primaryColor.withOpacity(0.5),
          ),
        ),
        child: TextFormField(
          enabled: false,
          minLines: 5,
          maxLines: 10,
          maxLength: 500,
          style: secondaryTextStyle.copyWith(
            fontSize: 14,
          ),
          // initialValue:
          //     'a b c d e f g h i j k l m n o p q r s t u v w x y z a b c d e f g h i j k l m n o p q r s t u v w x y z a b c d e f g h i j k l m n o p q r s t u v w x y z',
          initialValue: widget.eventModel.description,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
      );
    }

    Widget arrowRight() {
      return Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xffF4FFFE),
        ),
        child: Icon(
          Icons.arrow_forward,
          color: Color(0xff32B0C7),
        ),
      );
    }

    Widget loading() {
      return Container(
        width: 32,
        height: 32,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation(
            primaryTextColor,
          ),
        ),
      );
    }

    Widget customBottomNavbar() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        height: 80,
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(color: greyColor, width: 2),
        ),
        child: Container(
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              print('Check Availibility');

              setState(() {
                isLoading = !isLoading;
                print(isLoading);
              });
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Check Availibility',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                      ),
                    ),
                    Text(
                      'Starting from ${FormatCurrency().formatRupiah(widget.eventModel.price!)}',
                      style: primaryTextStyle.copyWith(
                        fontSize: 13,
                        fontWeight: reguler,
                      ),
                    ),
                  ],
                ),
                isLoading ? loading() : arrowRight(),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        color: whiteColor,
        height: double.infinity,
        child: ListView(
          children: [
            header(),
            imageEvent(),
            titleDetails(),
            keteranganEvent(),
            titleDescription(),
            bodyDescription(),
          ],
        ),
      ),
      bottomNavigationBar: customBottomNavbar(),
    );
  }
}
