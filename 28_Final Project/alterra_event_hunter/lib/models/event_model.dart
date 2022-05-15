class EventModel {
  late final String? imgThumbnail;
  late final String? name;
  late final int? price;
  late final String? city;
  late final String? location;
  late final String? description;
  late final String? dateStart;
  late final String? dateEnd;
  late final String? timeStart;
  late final String? timeEnd;

  EventModel({
    required this.imgThumbnail,
    required this.name,
    required this.price,
    required this.city,
    required this.location,
    required this.description,
    required this.dateStart,
    required this.dateEnd,
    required this.timeStart,
    required this.timeEnd,
  });

  Map<String, dynamic> toJson() {
    return {
      'imgThumbnail': imgThumbnail,
      'name': name,
      'price': price,
      'city': city,
      'location': location,
      'description': description,
      'dateStart': dateStart,
      'dateEnd': dateEnd,
      'timeStart': timeStart,
      'timeEnd': timeEnd,
    };
  }

  EventModel.fromJson(Map json) {
    imgThumbnail = json['imgThumbnail'];
    name = json['name'];
    price = json['price'];
    city = json['city'];
    location = json['location'];
    description = json['description'];
    dateStart = json['dateStart'];
    dateEnd = json['dateEnd'];
    timeStart = json['timeStart'];
    timeEnd = json['timeEnd'];
  }
}
