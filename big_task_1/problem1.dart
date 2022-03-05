import 'dart:io';

void main() {
  stdout.write('Masukan angka : ');
  int? angka = int.parse(stdin.readLineSync()!);

  print(isGenap(angka));
}

bool isGenap(int x) {
  return x % 2 == 0;
}
