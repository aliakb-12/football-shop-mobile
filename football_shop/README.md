** JAWBAN TUGAS 1 FLUTTER **

1. Widget tree adalah struktur hierarki dari semua widget yang digunakan dalam sebuah aplikasi Flutter.
Setiap tampilan di layar (seperti teks, tombol, atau layout) adalah sebuah widget, dan widget-widget tersebut tersusun seperti cabang pohon, di mana satu widget dapat berisi widget lainnya. seperti contohnya:
- Parent (induk): Widget yang membungkus widget lain.
- Child (anak): Widget yang dibungkus oleh widget lain.


2. 
- MaterialApp : Widget root aplikasi yang menyediakan konfigurasi global seperti theme, navigator, dan title. Semua widget lain berada di dalamnya.
- ThemeData : Menentukan tema warna aplikasi (misalnya warna utama dan sekunder).
- ColorScheme : Bagian dari ThemeData yang mengatur skema warna utama aplikasi (seperti primary dan secondary color).
- Scaffold : Menyediakan struktur dasar halaman seperti AppBar di atas dan Body di tengah.
- AppBar : Menampilkan bar di bagian atas halaman dengan judul “Football Shop”.
- Text : Menampilkan teks statis di layar, seperti judul halaman atau teks informasi.
- Row : Menyusun widget secara horizontal, digunakan untuk menampilkan tiga InfoCard sejajar.
- Column : Menyusun widget secara vertikal, misalnya untuk menempatkan teks sambutan dan grid produk.
- Card : Membuat tampilan kotak dengan bayangan (digunakan dalam InfoCard untuk menampilkan NPM, Nama, dan Kelas).
- Container : Mengatur ukuran, padding, dan tata letak internal pada berbagai elemen seperti Card dan tombol.
- GridView.count : Menampilkan item dalam bentuk grid (3 kolom), berisi ItemCard untuk setiap fitur seperti All Products, My Product, dan Create Product.
- Material : Memberi efek visual Material Design (seperti bayangan dan ripple effect) pada setiap kartu tombol.
- InkWell : Menangani interaksi klik pada kartu dengan efek gelombang air dan aksi SnackBar.
- Icon : Menampilkan ikon pada setiap tombol (misalnya ikon keranjang belanja, tas, dan tanda tambah).
- SnackBar : Menampilkan notifikasi singkat di bagian bawah layar saat tombol ditekan.
- Center : Menempatkan widget child di tengah halaman.
- Padding : Memberikan jarak di sekitar widget agar tidak terlalu rapat.
- SizedBox : Memberikan jarak vertikal antar elemen (misalnya antar bagian atas dan grid).
- MediaQuery : Digunakan di dalam InfoCard untuk menyesuaikan lebar kartu dengan ukuran layar perangkat.
- MyHomePage : Widget utama halaman yang menampilkan AppBar, InfoCard, dan ItemCard. Termasuk pengaturan tata letak utama aplikasi.
- InfoCard : Widget kustom untuk menampilkan informasi pribadi seperti NPM, Nama, dan Kelas dalam bentuk kartu.
- ItemHomepage : Kelas model sederhana yang menyimpan nama, ikon, dan warna dari setiap item pada grid.
- ItemCard : Widget kustom yang menampilkan tombol berbentuk kartu dengan ikon dan teks. Setiap kartu memiliki warna berbeda (item.color) dan efek klik menggunakan InkWell.


3. Widet material app berfungsi sebagai widget root utama pada aplikasi flutter yang berbasis material design. Fungsi utamanya adalah menyediakan konfigurasi global untuk seluruh aplikasi, seperti:
- Tema aplikasi (theme dan colorScheme)
- Judul aplikasi (title)
- Navigasi antar halaman (routes dan navigator)
- Pengaturan tampilan dasar berbasis Material Design
Widget ini sering digunakan karena:
- Semua widget lain memerulkan konteks dari materialApp agar dapat menggunakan gaya, warna, dan tema yang konsisten
- mengatur material styling, sehingga aplikasi langsung mendapatkan tampilan khas Android/Google

4. 
- StatelessWidget adalah widget yang tidak memiliki state (keadaan atau data yang bisa berubah). Artinya, tampilan widget ini tetap sama selama aplikasi berjalan
- StatefulWidget adalah widget yang memiliki state, yaitu data atau variabel yang bisa berubah seiring waktu. Saat state berubah, Flutter akan memanggil ulang metode build() untuk memperbarui tampilan sesuai dengan data terbaru

Kapan memilih salah satunya:
- Jika ingin tampilan tidak berubah secara runtime maka memakai StatelessWidget
- Jika ingin tampilan berubah dan terlihat interaktif maka memakai StatefulWidget

5. BuildContext adalah objek yang menyimpan informasi tentang posisi sebuah widget di dalam widget tree. Kegunaannya untuk mengetahui di mana widget berada di dalam widget tree. Ini untuk bisa mengakses data, menentukan hubungan antar widget, dan lainnya. BuildContext menjadi penting karena hampir semua fungsi yang berhubungan dengan tampilan, navigasi, dan tema memerlukannya.

Contoh penggunaan di method build():
*** @override
Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  return Text('Lebar layar: $screenWidth');
} ***
Penjelasan:
- context digunakan di sini untuk mengambil informasi lebar layar dari MediaQuery.
- Dengan BuildContext, widget bisa beradaptasi sesuai kondisi tampilan (misalnya ukuran layar atau tema warna).


5. 
-  Hot Restart akan memulai ulang seluruh aplikasi dari awal dan membangun ulang seluruh widget tree dari nol. Semua state atau data sementara akan hilang, dan aplikasi kembali ke kondisi awal seolah baru dijalankan lagi.
- Hot Reload adalah fitur Flutter yang memungkinkan kita melakukan perubahan kode langsung ke aplikasi yang sedang berjalan tanpa harus memulai ulang seluruh aplikasi. Dengan hot reload, perubahan seperti tata letak (layout), warna, teks, atau tampilan UI akan langsung diperbarui tanpa kehilangan state (data sementara).



** JAWBAN TUGAS 2 FLUTTER **
1. Navigator.push() digunakan untuk menambahkan halaman baru ke atas stack navigasi. Yang berarti ketika pengguna berpindah ke halaman baru, halaman sebelumnya tetap tersimpan di memori dan bisa diakses kembali menggunakan tombol “back”. Navigator.pushReplacement() menggantikan halaman saat ini dengan halaman baru. Halaman sebelumnya dihapus dari stack sehingga tidak bisa kembali dengan tombol “back”.
- Navigator.push() bisa digunakan ketika kita ingin user bisa balik ke halaman sebelimnya, seperti berpindah dari home ke product detail
- Navigator.pushReplacement() digunakan ketika logout agar halaman sebelumnya (yang butuh autentikasi) tidak bisa diakses lagi

2. Struktur dasar tiap halaman dibangun menggunakan Scaffold untuk memastikan tampilan konsisten di seluruh halaman.
- Scaffol merupakan kerangka halaman utama yang memuat struktur standar (AppBar, Drawer, Body)
- AppBar menampilkan judul halaman seperti “Home” atau “Tambah Produk”.
- Drawer menyediakan navigasi antarhalaman seperti createproduct dan home

3. Kelebihannya agar membantu menjaga tampilan tetap rapi, fleksibel, dan responsif di berbagai ukuran layar.
- Padding akan memberi jarak antar elemen agar tampilan tidak menempel pada tepi layar
- SingleChildScrollView memungkinkan halaman scrollable ketika isi form terlalu panjang.
- ListView digunakan untuk menampilkan daftar produk secara dinamis

4. Didalam main.dart bisa mengganti ganti colorschemenya, dan mengganti warna menjadi merah dan putih sesuai dengan brand toko. 




** JAWABAN TUGAS 3 FLUTTER **
1. 
Alasan membuat model Dart:
- Validasi tipe data (type safety), Model membantu memastikan setiap field memiliki tipe yang tepat—misalnya title harus String, price harus int, dst.
- Null-safety dan error prevention. Tanpa model, Map<String, dynamic> membuat semua field bisa null atau salah tipe tanpa warning. Dengan model: field dapat ditandai required, sehingga error terdeteksi sebelum runtime.
- Maintainability & scalability. Ketika API berubah, cukup memperbarui model. Jika pakai Map acak harus mencari semua tempat di mana JSON digunakan, bisa rentan bug.

Jika langsung memetakan JSON sebagai Map tanpa model:
- Tidak ada jaminan tipe data, akan rawan runtime error
- Mistyped key (misal "titile" vs "title") tidak ketahuan sampai crash.
- Tidak ada struktur yang jelas → file Flutter jadi berantakan.

2. 
Package http untuk: 
- Mengirim request HTTP tanpa autentikasi cookie.
- Cocok untuk public API, fetch data read-only.
Cookie request digunakan untuk:
- Login ke Django dengan session-based authentication.
- Menyimpan dan mengirim cookie secara otomatis pada setiap request.
- Mengelola state login/logout.
Perbedaan: 
- Cookie reqeust akan menyimpan cookie session, sedangkan http tidak
- login/register menggunakan cookie sedangkan tidak menggunakan http

3. 
Karena state login harus konsisten di seluruh aplikasi.
CookieRequest menyimpan:
- session cookie
- informasi user
- status login

Jika setiap widget punya instance berbeda:
- session tidak konsisten
- user bisa dianggap logout saat pindah halaman
- request gagal karena cookie tidak sinkron

4. 
- ALLOWED_HOSTS : 
  - Tambahkan IP emulator Android (10.0.2.2) atau 127.0.0.1 untuk testing lokal.
  - Tanpa ini, Django akan menolak request karena dianggap berasal dari host yang tidak diizinkan.

- CORS:
  - Aktifkan CORS agar request dari aplikasi Flutter tidak diblokir oleh Django.
  - Jika tidak diatur, Flutter tidak dapat mengambil atau mengirim data ke backend.

- SameSite & Cookie Settings
  - Untuk autentikasi berbasis session, cookie Django harus bisa dikirim pada request cross-site.
  - Karena itu, perlu pengaturan seperti:
  - SESSION_COOKIE_SAMESITE = "None"
  - SESSION_COOKIE_SECURE = True
  - CSRF_COOKIE_SAMESITE = "None"
  - CSRF_COOKIE_SECURE = True

- Internet Permission (Android)
  - Tambahkan izin internet di android/app/src/main/AndroidManifest.xml:

5. 
- user input:
   Pengguna mengisi form di Flutter (nama, harga, deskripsi, dll).
- Parsing dan mode:
   Data diubah menjadi model Dart atau `Map<String, dynamic>`.
- Request ke django
   Flutter mengirim data menggunakan:
   - `CookieRequest.post()` untuk POST
   - `CookieRequest.get()` untuk GET
- Django memproses
   Django menerima JSON, memvalidasi, memperbarui database, dan mengembalikan JSON.
- Response ke flutter
   JSON diparse menjadi model Dart lalu ditampilkan di UI (ListView, Card, dll).

6. 
- Login
  1. Flutter mengirim username dan password ke endpoint `/auth/login/`.
  2. Django memvalidasi dan membuat session user.
  3. CookieRequest menyimpan cookie session.
  4. Flutter menampilkan halaman menu karena user dianggap sudah login.

- Register
  1. Flutter mengirim data akun baru ke `/auth/register/`.
  2. Django membuat user baru lalu mengembalikan status berhasil/gagal.

- Logout
  1. Flutter memanggil `/auth/logout/`.
  2. Django menghapus session user.
  3. CookieRequest menghapus cookie.
  4. Flutter kembali ke halaman login.

7. 