import 'package:intl/intl.dart';

class FormatCurrency {
  String formatRupiah(int number) {
    return NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp',
      decimalDigits: 0,
    ).format(number);
  }
}
