# (21) Flutter State Management (BLoC)

# RESUME MATERI : 06/04/2022

## Flutter State Management (BLoC)

### Tuliskan 3 poin yang dipelajari dari materi tersebut. Resume / ringkasan materi dapat disubmit melalui Github.

1. Declarative UI
   - Flutter memiliki sifat declarative yang artinya flutter membangun UI nya pada screen untuk mencerminkan keadaan state ini

2. State
   - State adalah ketika sebuah widget sedang aktif dan widget tersebut menyimpan data di memori 
   - Flutter akan membangun ulang Ul nya ketika ada state atau data yang berubah 
   - Ada 2 jenis state dalam flutter, ephemeral state dan app state
   
3. Ephemeral State
   - Digunakan ketika tidak ada bagian lain pada widget tree yang membutuhkan untuk mengakses data widget nya, contohnya:
     - PageView
     - BottomNavigationBar
     - Switch Button. 
   - Tidak perlu state management yang kompleks 
   - Hanya membutuhkan StatefulWidget dengan menggunakan fungsi setState()

### Pada praktikum kali ini diberikan soal sebagai berikut
![Soal](//21_Flutter%20State%20Management%20(BLoC)/screenshots/soal21.png)


### Output
![Soal](//21_Flutter%20State%20Management%20(BLoC)/screenshots/preview.gif)




