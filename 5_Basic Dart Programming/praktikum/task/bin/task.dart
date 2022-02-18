/* 

note : Introduction to Algorithm and Dart Programming

todo : Task 17/02/2022

*1. Implementasikan rumus luas lingkaran pada program Dart!
*2. Buatlah 3 buah variabel yang berisi string, lalu sambungkan seluruh string tersebut, dan tampilkan pada layar!

*/

double luasLingkaran(double r) {
  final pi = 3.14;

  return pi * r * r;
}

void main() {
  // note : 1

  var r = 7.0;

  print('Luas lingkaran dengan r = $r adalah ${luasLingkaran(r)}');

  // note : 2

  var string1 = 'Nama';
  var string2 = 'Saya';
  var string3 = 'Dito';

  print('$string1 $string2 $string3');
}
