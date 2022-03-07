import 'dart:io';

void main() {
  stdout.write('Masukan angka pertama: ');
  int? angkaPertama = int.parse(stdin.readLineSync()!);

  stdout.write('Masukan angka kedua: ');
  int? angkaKedua = int.parse(stdin.readLineSync()!);

  stdout.write('Masukan Operator [+ , -, /, *] : ');
  String? operator = stdin.readLineSync()!;

  var hasil;

  if (operator == '+') {
    hasil = angkaPertama + angkaKedua;
  } else if (operator == '-') {
    hasil = angkaPertama - angkaKedua;
  } else if (operator == '/') {
    hasil = angkaPertama / angkaKedua;
  } else if (operator == '*') {
    hasil = angkaPertama * angkaKedua;
  } else {}

  if (hasil == null) {
    print('Operator tidak valid');
  } else {
    print('$angkaPertama $operator $angkaKedua = $hasil');
  }
}
