// Buatlah perulangan dari data di atas, print name, cuisine, ratings dari data di atas.

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

  for (var i = 0; i < restaurants.length; i++) {
    restaurants[i]['ratarata'] = rataRata(restaurants[i]['ratings']);
  }

  var counter = 1;
  for (var item in restaurants) {
    print('Restaurant : $counter');
    print('Name :  ${item['name']}');
    print('Cuisine :  ${item['cuisine']}');
    print('Ratings :  ${item['ratings']}');
    print('Rata Rata :  ${item['ratarata']}');
    print('=============================');
    counter++;
  }
}

double rataRata(var iniList) {
  num hasil = 0;

  for (var i = 0; i < iniList.length; i++) {
    hasil = hasil + iniList[i];
  }

  return hasil / 3;
}
