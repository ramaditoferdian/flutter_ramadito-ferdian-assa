String check(double value) {
  if (value > 70) {
    return 'A';
  } else if (value > 40) {
    return 'B';
  } else if (value > 0) {
    return 'C';
  } else {
    return '';
  }
}

void main() {
  print(check(80));
}
