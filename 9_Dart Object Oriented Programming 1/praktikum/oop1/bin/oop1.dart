import 'hewan.dart';
import 'mobil.dart';

void main(List<String> arguments) {
  var h1 = Hewan();
  var h2 = Hewan();

  h1.berat = 9;
  h2.berat = 8;

  var mobil = Mobil();

  mobil.tambahMuatan(h1);
  mobil.tambahMuatan(h2);

  print(mobil.muatan);
  print(mobil.totalMuatan());
}
