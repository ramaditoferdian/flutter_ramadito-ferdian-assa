# (5) Basic Dart Programming

# RESUME MATERI : 18/02/2022

## Basic Dart Programming

Tuliskan 3 poin yang dipelajari dari materi tersebut. Resume / ringkasan materi dapat disubmit melalui Github.
------------------------------------------------------------------------------------------------------------------------------------------------------

- Arrow function yaitu fungsi yang dapat memiliki nama maupun tidak, ia berisi 1 data (ari proses maupun data statis), dan nilai hasil pengembalian (return) diambil dari data tersebut. Ex : void sum = (int a, int b) => a+b;

- Async-Await adalah menjalankan beberapa proses tanpa perlu menunggu, proses ditulis dalam bentuk fungsi, selain itu juga await akan menunggu hingga proses async selesai.

- Tipe data Future merupakan data yang dapat ditunggu, membawa data rerun dari fungsi async. Ex :

Future<int> P1 (int a, int b){
    return Future.delayed(Duration(seconds: 1), (){
        return (a+b);
    })
}

void main() async{
    var data = await P1(2, 3);
    print(data);
}