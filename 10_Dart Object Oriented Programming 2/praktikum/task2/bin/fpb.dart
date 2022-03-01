import 'matematika.dart';

class FPB implements Matematika {
  late int x;
  late int y;

  FPB(this.x, this.y);

  @override
  int hasil() {
    int r = 0;

    while (y != 0) {
      r = x % y;
      x = y;
      y = r;
    }

    return x;
  }
}
