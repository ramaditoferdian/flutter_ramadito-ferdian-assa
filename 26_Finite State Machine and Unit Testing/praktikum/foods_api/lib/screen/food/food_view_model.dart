import 'package:flutter/material.dart';
import 'package:foods_api/model/api/food_api.dart';
import 'package:foods_api/model/food_model.dart';

class FoodViewModel with ChangeNotifier {
  List<FoodModel> _foods = [];

  List<FoodModel> get foods => _foods;

  set events(List<FoodModel> foods) {
    _foods = foods;
    notifyListeners();
  }

  Future<void> getFoodsFromAPI() async {
    try {
      List<FoodModel> foods = await FoodAPI.getFoodFromAPI();

      _foods = foods;
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
