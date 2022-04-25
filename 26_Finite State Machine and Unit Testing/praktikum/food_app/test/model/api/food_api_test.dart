import 'package:food_app/model/api/food_api.dart';
import 'package:food_app/model/food_model.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'food_api_test.mocks.dart';

@GenerateMocks([FoodAPI])
void main() {
  group('FoodAPI', () {
    FoodAPI foodAPI = MockFoodAPI();

    test('Fetching Food Data from API ', () async {
      when(foodAPI.getFoodFromAPI()).thenAnswer(
        (_) async => <FoodModel>[
          FoodModel(id: 1, name: 'Bakso'),
        ],
      );

      var foods = await foodAPI.getFoodFromAPI();
      expect(foods.isNotEmpty, true);
    });
  });
}
