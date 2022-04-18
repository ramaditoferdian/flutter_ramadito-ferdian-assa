import 'package:consume_api/utils/random_hex_color.dart';

class ContactModel {
  late final int? id;
  late final String? name;
  late final String? phoneNumber;
  late final int? avatarColor;

  ContactModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.avatarColor,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phoneNumber,
      'avatarColor': avatarColor,
    };
  }

  ContactModel.fromMap(Map map) {
    id = map['id'];
    name = map['name'];
    phoneNumber = map['phone'];

    avatarColor =
        map['avatarColor'] ?? RandomHexColor().generateRandomHexColor();
  }
}
