import 'package:flutter/material.dart';

class Destination {
  String? imgThumbnail;
  String? name;
  String? price;

  Destination({
    required this.imgThumbnail,
    required this.name,
    required this.price,
  });
}

List<Destination> destinationList = [
  Destination(
    imgThumbnail:
        'https://d2ile4x3f22snf.cloudfront.net/wp-content/uploads/sites/329/2018/10/29141024/monas8.jpg',
    name: 'Monas Jakarta',
    price: '25.000',
  ),
  Destination(
    imgThumbnail:
        'https://s3-ap-southeast-1.amazonaws.com/loket-production-sg/images/banner/20210921123822.jpg',
    name: 'Bali Zoo Park',
    price: '67.500',
  ),
  Destination(
    imgThumbnail:
        'https://s3-ap-southeast-1.amazonaws.com/loket-production-sg/images/banner/20220321044617.jpg',
    name: 'Jakarta VS Everbody',
    price: '30.000',
  ),
  Destination(
    imgThumbnail:
        'https://s3-ap-southeast-1.amazonaws.com/loket-production-sg/images/banner/20220321092258.jpg',
    name: 'Hafiz Hafizah Mecca Adventure',
    price: '75.000',
  ),
  Destination(
    imgThumbnail: 'https://cdn.cgv.id/uploads/movie/compressed/22004500.jpg',
    name: 'JUJUTSU KAISEN 0',
    price: '40.000',
  ),
  Destination(
    imgThumbnail:
        'https://s3-ap-southeast-1.amazonaws.com/loket-production-sg/images/banner/20220322053853.png',
    name: 'IBL Tokopedia All Star 2022',
    price: '65.000',
  ),
  Destination(
    imgThumbnail:
        'https://s3-ap-southeast-1.amazonaws.com/loket-production-sg/images/banner/20210204042737.jpg',
    name: 'Splash Water park',
    price: '125.000',
  ),
];
