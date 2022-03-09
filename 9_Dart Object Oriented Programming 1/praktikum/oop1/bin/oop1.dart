import 'hewan.dart';
import 'mobil.dart';

void main(List<String> arguments) {
  var h1 = Hewan();
  var h2 = Hewan();
  var h3 = Hewan();

  h1.berat = 9;
  h2.berat = 8;
  h3.berat = 20;

  var mobil = Mobil();

  mobil.tambahMuatan(h1);
  mobil.tambahMuatan(h2);
  mobil.tambahMuatan(h3);

  print(mobil.muatan);
  print(mobil.totalMuatan());
}
