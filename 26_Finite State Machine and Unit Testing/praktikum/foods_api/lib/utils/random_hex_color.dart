import 'dart:math';

class RandomHexColor {
  Random random = Random();
  int generateRandomHexColor() {
    int length = 6;
    String chars = '0123456789ABCDEF';
    String hex = '0xff';
    while (length-- > 0) {
      hex += chars[(random.nextInt(16)) | 0];
    }
    return int.parse(hex);
  }
}
