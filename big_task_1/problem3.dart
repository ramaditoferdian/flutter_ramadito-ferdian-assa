import 'dart:io';

void main() {
  stdout.write('Masukan angka : ');
  int? angka = int.parse(stdin.readLineSync()!);
  jamPasir(angka);
}

void jamPasir(int angka) {
  for (var i = 0; i < 2 * angka - 1; i++) {
    if (i < angka) {
      for (var j = angka - i; j < angka; j++) {
        stdout.write(" ");
      }
      for (var j = i; j < angka; j++) {
        stdout.write("* ");
      }
    } else {
      for (var j = i + 1; j < angka * 2 - 1; j++) {
        stdout.write(" ");
      }
      for (var j = 2 * angka - i - 1; j <= angka; j++) {
        stdout.write("* ");
      }
    }
    print('');
  }
}
