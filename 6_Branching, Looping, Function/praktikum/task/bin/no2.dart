int factorial(int n) {
  var value = 1;
  for (var i = 1; i <= n; i++) {
    value = value * i;
  }
  if (n > 0) {
    return value;
  } else {
    return 0;
  }
}

void main() {
  var n = 4;

  print(factorial(n));
}
