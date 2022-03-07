void main() {
  fetchUserData();
  print('hello');
}

Future<void> fetchUserData() async {
  return await Future.delayed(
    Duration(seconds: 1),
    () => print('data berhasil di dapatkan'),
  );
}


// Output : 
//          hello
//          data berhasil di dapatkan