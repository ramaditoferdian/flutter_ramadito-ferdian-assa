Future<List> kalikan(List list, int pengali) async {
  var newList = List(list.length);
  var idx = 0;

  for (var i in list) {
    newList[idx] = i * pengali;
    idx++;
  }
  return newList;
}

void main() async {
  var listAwal = [2, 4, 6, 8, 10];

  var listBaru = await kalikan(listAwal, 2);

  print(listBaru);
}
