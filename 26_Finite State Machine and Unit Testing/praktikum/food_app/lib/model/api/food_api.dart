import 'package:dio/dio.dart';
import 'package:food_app/model/food_model.dart';

class FoodAPI {
  static Future<List<FoodModel>> getFoodFromAPI() async {
    var baseUrl =
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/foods';

    Response<List<dynamic>> response = await Dio().get(baseUrl);

    if (response.statusCode == 200) {
      List<FoodModel> contacts = response.data!.map((e) {
        return FoodModel.fromMap(e);
      }).toList();
      return contacts;
    }

    throw Exception();
  }
}
