import 'fpb.dart';
import 'kpk.dart';

void main(List<String> arguments) {
  var x = 36;
  var y = 54;

  var resultKPK = KPK(x, y);
  var resultFPB = FPB(x, y);

  print(resultKPK.hasil());

  print(resultFPB.hasil());
}
