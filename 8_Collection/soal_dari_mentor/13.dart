void main() {
  double celcius = 100;

  Map hasil = konversiCelcius(100);

  print('celcius: $celcius');

  print(hasil);
}

Map<String, double> konversiCelcius(double suhu) {
  return {
    'kelvin': (suhu + 273.15),
    'fahrenheit': (suhu * 1.8) + 32,
    'reamur': (suhu * 0.8)
  };
}
