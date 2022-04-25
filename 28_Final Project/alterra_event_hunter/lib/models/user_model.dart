class UserModel {
  late final String? uid;
  late final String? role;
  late final String? email;
  late final String? fullName;
  late final int? phoneNumber;

  UserModel({
    required this.uid,
    required this.role,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'fullName': fullName,
      'role': role,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  UserModel.fromJson(Map json) {
    uid = json['uid'];
    fullName = json['fullName'];
    role = json['role'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
  }
}
