import 'dart:io';

void main() {
  stdout.write('Masukan angka : ');
  int? angka = int.parse(stdin.readLineSync()!);
  diagonalAngka(angka);
}

void diagonalAngka(int angka) {
  for (var i = 1; i <= angka; i++) {
    print('');
    for (var j = 1; j <= angka; j++) {
      if ((i <= j) && (i <= angka && i >= j)) {
        stdout.write(j);
      } else {
        stdout.write(' ');
      }
    }
  }
}
