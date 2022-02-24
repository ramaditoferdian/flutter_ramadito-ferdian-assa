# (8) Collection

# RESUME MATERI : 21/02/2022

## Collection

### Tuliskan 3 poin yang dipelajari dari materi tersebut. Resume / ringkasan materi dapat disubmit melalui Github.


- Map adalah collection yang menyimpan data secara key-value, dimana key berguna selayaknya index pada list

- Async-Await adalah menjalankan beberapa proses tanpa perlu menunggu, proses ditulis dalam bentuk fungsi, selain itu juga await akan menunggu hingga proses async selesai.

- Tipe data Future merupakan data yang dapat ditunggu, membawa data rerun dari fungsi async. Example :

        Future<int> P1 (int a, int b){
            return Future.delayed(Duration(seconds: 1), (){
                return (a+b);
            })
        }

        void main() async{
            var data = await P1(2, 3);
            print(data);
        }


### Pada praktikum kali ini diberikan 2 soal sebagai berikut
![image](https://user-images.githubusercontent.com/36509167/155484558-8e71a564-42f3-437c-ba77-d0bd6f4536ef.png)

 
