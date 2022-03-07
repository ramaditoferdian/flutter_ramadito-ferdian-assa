void main() {
  var restaurants = [
    {
      'name': 'Pizza Mario',
      'cuisine': 'Italian',
      'ratings': [4.0, 3.5, 4.5],
    },
    {
      'name': 'Chez Anne',
      'cuisine': 'French',
      'ratings': [5.0, 4.5, 4.0],
    },
    {
      'name': 'Navaratna',
      'cuisine': 'Indian',
      'ratings': [4.0, 4.5, 4.0],
    },
  ];

  //  Tambahkan 1 data (name, cuisine, ratings) ke variable restaurants.

  restaurants.add(
    {
      'name': 'KFC',
      'cuisine': 'America',
      'ratings': [5.0, 4.8, 4.2],
    },
  );

  print(restaurants);
}
