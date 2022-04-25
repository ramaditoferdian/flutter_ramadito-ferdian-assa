// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:food_app/model/api/food_api.dart';
import 'package:food_app/model/food_model.dart';

enum FoodViewState {
  none,
  loading,
  error,
}

class FoodViewModel with ChangeNotifier {
  FoodViewState _state = FoodViewState.none;
  FoodViewState get state => _state;

  List<FoodModel> _foods = [];

  List<FoodModel> get foods => _foods;

  set foods(List<FoodModel> foods) {
    _foods = foods;
    notifyListeners();
  }

  changeState(FoodViewState s) {
    _state = s;
    notifyListeners();
  }

  getFoodsFromAPI() async {
    changeState(FoodViewState.loading);

    try {
      List<FoodModel> foods = await FoodAPI().getFoodFromAPI();

      _foods = foods;

      notifyListeners();

      changeState(FoodViewState.none);
    } catch (e) {
      print(e);

      changeState(FoodViewState.error);
    }
    notifyListeners();
  }
}
