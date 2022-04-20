import 'package:dio/dio.dart';
import 'package:mvvm/model/contact_model.dart';

class ContactAPI {
  static Future<List<ContactModel>> getContactFromAPI() async {
    Response<List<dynamic>> response = await Dio().get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/');

    if (response.statusCode == 200) {
      List<ContactModel> contacts = response.data!.map((e) {
        return ContactModel.fromMap(e);
      }).toList();
      return contacts;
    }

    throw Exception();
  }
}
