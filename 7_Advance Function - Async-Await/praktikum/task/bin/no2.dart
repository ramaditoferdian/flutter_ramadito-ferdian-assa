void main() {
  var sebuahList = [
    [1, 'a'],
    [2, 'b'],
    [3, 'c'],
    [4, 'd'],
  ];

  var toMap = {for (var item in sebuahList) item[0]: item[1]};

  for (var key in toMap.keys) {
    print('$key : ${toMap[key]}');
  }
}
