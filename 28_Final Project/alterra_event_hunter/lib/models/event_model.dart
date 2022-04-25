class EventModel {
  late final String? imgThumbnail;
  late final String? name;
  late final int? price;
  late final String? city;
  late final String? location;
  late final String? description;

  EventModel({
    required this.imgThumbnail,
    required this.name,
    required this.price,
    required this.city,
    required this.location,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'imgThumbnail': imgThumbnail,
      'name': name,
      'price': price,
      'city': city,
      'location': location,
      'description': description,
    };
  }

  EventModel.fromJson(Map json) {
    imgThumbnail = json['imgThumbnail'];
    name = json['name'];
    price = json['price'];
    city = json['city'];
    location = json['location'];
    description = json['description'];
  }
}
