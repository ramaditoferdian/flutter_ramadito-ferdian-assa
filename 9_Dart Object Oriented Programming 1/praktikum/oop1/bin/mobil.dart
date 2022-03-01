import 'hewan.dart';

class Mobil {
  var muatan = [];

  void tambahMuatan(Hewan hewan) {
    if (muatan.length <= 10) {
      muatan.add(hewan.berat);
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
