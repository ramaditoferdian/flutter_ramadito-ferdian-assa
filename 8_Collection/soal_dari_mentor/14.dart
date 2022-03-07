import 'dart:io';

void main() {
  stdout.write('Masukan angka : ');
  int? angka = int.parse(stdin.readLineSync()!);

  if (isGenap(angka)) {
    print('$angka merupakan bilangan Genap');
  } else {
    print('$angka merupakan bilangan Ganjil');
  }
}

bool isGenap(int x) {
  return x % 2 == 0;
}
