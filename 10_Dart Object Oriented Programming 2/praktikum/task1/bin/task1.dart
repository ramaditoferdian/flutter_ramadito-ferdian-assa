import 'Balok.dart';
import 'Kubus.dart';

void main(List<String> arguments) {
  var cube1 = Kubus(3);
  var balok1 = Balok(3, 4, 5);

  print('Volume Kubus(${cube1.sisi}) = ${cube1.volume()}');
  print(
    'Volume Balok(${balok1.panjang}, ${balok1.lebar}, ${balok1.tinggi}) = ${balok1.volume()}',
  );
}
