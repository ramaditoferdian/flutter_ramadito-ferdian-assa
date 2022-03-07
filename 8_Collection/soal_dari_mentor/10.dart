void main() {
  String text = 'I like pizza';
  String topping = 'with tomatoes';
  String favourite = '$text $topping';
  String newText = favourite.replaceAll('pizza', 'pasta');
  favourite = 'Now I like curry';

  print(newText);
}

// note : Sebutkan variable mana saja yang bisa di jadikan const, final, var/type data. Berikan penjelasan.

/*
  * untuk const : text, topping karena mereka sudah harus di inisiasi di awal dan tidak diubah nilainya
  * untuk final : text, topping karena mereka sudah harus di inisiasi di awal dan tidak diubah nilainya

  * var/type data : favorite, newText karena mereka memiliki nilai yang dapat berubah

*/