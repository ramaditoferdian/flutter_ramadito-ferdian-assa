class BangunRuang {
  final double panjang;
  final double lebar;
  final double tinggi;

  BangunRuang(this.panjang, this.lebar, this.tinggi);

  double volume() {
    return panjang * lebar * tinggi;
  }
}
