import 'fpb.dart';
import 'matematika.dart';

class KPK implements Matematika {
  late int x;
  late int y;

  KPK(this.x, this.y);

  @override
  int hasil() {
    return x * y ~/ FPB(x, y).hasil(); // note : integer division operator '~/'
  }
}
