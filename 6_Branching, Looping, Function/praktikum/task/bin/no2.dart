BigInt factorial(BigInt n) {
  var value = BigInt.from(1);
  for (var i = BigInt.from(1); i <= n;) {
    value = value * i;
    i = i + BigInt.from(1);
  }
  if (n > BigInt.from(0)) {
    return value;
  } else {
    return BigInt.from(0);
  }
}

void main() {
  print('Nilai Faktorial dari 10 = ${factorial(BigInt.from(10))}');
  print('Nilai Faktorial dari 20 = ${factorial(BigInt.from(20))}');
  print('Nilai Faktorial dari 30 = ${factorial(BigInt.from(30))}');
}
