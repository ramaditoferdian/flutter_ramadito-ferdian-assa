import 'BangunRuang.dart';

class Kubus extends BangunRuang {
  double sisi = 0.0;

  Kubus(this.sisi) : super(sisi, sisi, sisi);

  @override
  double volume() {
    return (sisi * sisi * sisi);
  }
}
