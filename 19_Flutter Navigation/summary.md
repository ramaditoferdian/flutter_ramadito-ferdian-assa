# (17) Form Input Button

# RESUME MATERI : 28/03/2022

## Form Input Button

### Tuliskan 3 poin yang dipelajari dari materi tersebut. Resume / ringkasan materi dapat disubmit melalui Github.

1. Navigation Dasar
   - Perpindahan halaman menggunakan `Navigator.push()`
   - Kembali ke halaman sebelumnya menggunakan `Navigator.pop()`

2. Navigation dengan `Named Routes`
   - Perpindahan halaman menggunakan `Navigator.pushNamed()`
   - Kembali ke halaman sebelumnya menggunakan `Navigator.pop()`

3. Mendaftarkan Route
   - Tambahan `initialROute` dan `routes` pada `MaterialApp`
   - Tiap route adalah fungsi yang membentuk halaman
    ```bash
        MaterialApp(
            initialRoute: '/',

            routes:{
                '/': (context) => HomeScreen(),
                '/detail-screen': (context) => DetailScreen(),
            }
        )
    ```
    

### Pada praktikum kali ini diberikan soal sebagai berikut
![Soal](/19_Flutter%20Navigation/screenshots/soal19.png)

### Routes pada main.dart
![Soal](/19_Flutter%20Navigation/screenshots/routes.png)

### Navigation tanpa named routes
![Soal](/19_Flutter%20Navigation/screenshots/contoh1.png)

### Navigation dengan named routes
![Soal](/19_Flutter%20Navigation/screenshots/contoh2.png)

### Output
![Soal](/19_Flutter%20Navigation/screenshots/DemoApp.gif)




