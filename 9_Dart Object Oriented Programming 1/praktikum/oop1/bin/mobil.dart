import 'hewan.dart';

class Mobil {
  var muatan = [];
  final double kapasitas = 30;

  void tambahMuatan(Hewan hewan) {
    var sumOfMuatan = totalMuatan();

    var slot = kapasitas - sumOfMuatan;

    if (hewan.berat <= slot) {
      muatan.add(hewan.berat);

      print('Hewan [${hewan.berat}] berhasil ditambahkan');
    } else {
      print(
          'Kapasitas mobil penuh !, hewan [${hewan.berat}] gagal ditambahkan');
    }
  }

  double totalMuatan() {
    var sum = 0.0;
    for (var item in muatan) {
      sum += item;
    }
    return sum;
  }
}
