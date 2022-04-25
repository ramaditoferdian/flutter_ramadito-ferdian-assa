import 'package:alterra_event_hunter/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.uid).set({
        'email': user.email,
        'fullName': user.fullName,
        'role': user.role,
        'phoneNumber': user.phoneNumber,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> getUserById(String uid) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(uid).get();

      return UserModel(
        uid: uid,
        email: snapshot['email'],
        role: snapshot['role'],
        fullName: snapshot['fullName'],
        phoneNumber: snapshot['phoneNumber'],
      );
    } catch (e) {
      throw e;
    }
  }
}
