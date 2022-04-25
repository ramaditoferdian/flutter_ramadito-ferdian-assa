class FoodModel {
  late final int? id;
  late final String? name;

  FoodModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  FoodModel.fromMap(Map map) {
    id = map['id'];
    name = map['name'];
  }
}
