import 'dart:io';

void main() {
  stdout.write('Masukan angka : ');
  int? angka = int.parse(stdin.readLineSync()!);

  print(azimuth(angka));
}

int azimuth(int bilangan) {
  var temp = 0;

  if (bilangan >= 180) {
    temp = bilangan - 180;
    if (temp <= 0 && temp >= 360) {
      return 0;
    } else {
      return temp;
    }
  } else {
    temp = bilangan + 180;
    if (temp <= 0 && temp >= 360) {
      return 0;
    } else {
      return temp;
    }
  }
}
