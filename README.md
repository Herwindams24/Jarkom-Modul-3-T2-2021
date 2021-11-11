# Lapres Modul 3 Jarkom 2021 - T02
Laporan Hasil Praktikum Modul 3 Jarkom 2021
Kelompok T02
  * Herwinda Marwaa Salsabila (05311940000009)
  * Dian Arofati N. Z. (05311940000011)
  * Dava Aditya Jauhar (05311940000030)

---
### Pendahuluan
	
Setting topologi dengan menambahkan beberapa node ethernet switch dan ubuntu, lalu buat hubungan antar node dan nama-nama dari node hingga seperti di gambar

<img src="https://github.com/Herwindams24/soalshift-3/blob/main/Image/topologi.png?raw=true" width="700">

---
## Nomor 01
   **Soal**
   
   Luffy bersama Zoro berencana membuat peta tersebut dengan kriteria EniesLobby sebagai DNS Server, Jipangu sebagai DHCP Server, Water7 sebagai Proxy Server 
   
   **Jawaban**
   
   1. Edit masing-masing konfigurasi tiap node seperti gambar di bawah ini:
   
      **Jipangu**
   
      <img src="" width="500">
   
      **Water 7**
   
      <img src="" width="500">
    
      **EniesLobby**
   
      <img src="" width="500">
   
  
---

## Nomor 02
   **Soal**
   
   dan Foosha sebagai DHCP Relay 

   **Jawaban**
   
   <img src="" width="500">
   
   1. Update ubuntu sebelum menginstall DHCP Relay 
   
      ```
      apt-get update
      apt-get install isc-dhcp-relay
      ```
      
   2. Setting `sysctl` untuk IP Forwarding
    
      ```
      echo 'net.ipv4.ip_forward=1' > /etc/sysctl.conf
      sysctl -p
      ```
      
   3. Edit konfigurasi isc-dhcp-relay agar sesuai dengan isc-dhcp-server di Jipangu. Server yang dituju merupakan IP Server Jipangu yang merupakan DHCP server. `INTERFACES=` diisi dengan eth1 eth3 eth2, karena pada DHCP relay (Foosha) akan meneruskan DHCP request dari network interface eth1 dan eth3, lalu meneruskannya ke DHCP server melalui eth2.

      ```
      echo '
       SERVERS="192.212.2.4"
       INTERFACES="eth1 eth3 eth2"
       ' > /etc/default/isc-dhcp-relay
      ```

   4. Restart service isc-dhcp-relay

      ```
      service isc-dhcp-relay restart
      ```
---

## Nomor 03
   **Soal**
   
   Ada beberapa kriteria yang ingin dibuat oleh Luffy dan Zoro, yaitu:
   
   1. Semua client yang ada HARUS menggunakan konfigurasi IP dari DHCP Server.
	
   2. Client yang melalui Switch1 mendapatkan range IP dari [prefix IP].1.20 - [prefix IP].1.99 dan [prefix IP].1.150 - [prefix IP].1.169

   **Jawaban**
   
   1. Install DHCP Server. Pastikan DHCP Server telah terinstal dengan melakukan cek versi. 
   	
      ```
       apt-get update
       apt-get install isc-dhcp-server 
       dhcpd --version
      ```
	
   2. Lalu setting INTERFACES yang digunakan oleh JIPANGU pada /root/script.sh dan cek apakah Interface telah sesuai setelah di bash pad file /etc/default/isc-dhcp-server
      
      ```
       echo 'INTERFACES="eth0"' > /etc/default/isc-dhcp-server
      ```
      
      <img src="" width="500">
      
   3. Agar DHCP Server dapat berjalan dan tidak error, perlu deklarasi subnet yang terkoneksi pada JIPANGU (subnet dari eth0 JIPANGU) pada /etc/dhcp/dhcpd.conf. Untuk subnet 2 tidak harus memiliki settingan dhcp.
      
      ```
      echo '
      subnet 192.212.2.0  netmask 255.255.255.248 {
      }' > /etc/dhcp/dhcpd.conf
      ```
  4. ....
     ```
     ### Switch 1 (Loguetown, Alabasta)
      echo '
      subnet 192.212.1.0  netmask 255.255.255.0 {
      range 192.212.1.20 192.212.1.99;
      range 192.212.1.150 192.212.1.169;
      option routers 192.212.1.1;
      option broadcast-address 192.212.1.255;
      option domain-name-servers 192.212.2.2;
      default-lease-time 360;
      max-lease-time 7200;
     }' >> /etc/dhcp/dhcpd.conf
     ```
---

## Nomor 04
   **Soal**
   
   Client yang melalui Switch3 mendapatkan range IP dari [prefix IP].3.30 - [prefix IP].3.50 
   
   **Jawaban**
   
---

## Nomor 05
   **Soal**
   
   Client mendapatkan DNS dari EniesLobby dan client dapat terhubung dengan internet melalui DNS tersebut.
   
   **Jawaban**

---

## Nomor 06
   **Soal**
   
   Lama waktu DHCP server meminjamkan alamat IP kepada Client yang melalui Switch1 selama 6 menit sedangkan pada client yang melalui Switch3 selama 12 menit. Dengan waktu maksimal yang dialokasikan untuk peminjaman alamat IP selama 120 menit.


   **Jawaban**

---

## Nomor 07
   **Soal**
   
   Luffy dan Zoro berencana menjadikan Skypie sebagai server untuk jual beli kapal yang dimilikinya dengan alamat IP yang tetap dengan IP [prefix IP].3.69

   **Jawaban**

---

## Nomor 08
   **Soal**
   
   Pada Loguetown, proxy harus bisa diakses dengan nama jualbelikapal.yyy.com dengan port yang digunakan adalah 5000

   **Jawaban**

---

## Nomor 09
   **Soal**
   
   Agar transaksi jual beli lebih aman dan pengguna website ada dua orang, proxy dipasang autentikasi user proxy dengan enkripsi bcrypt dengan dua username, yaitu luffybelikapalyyy dengan password luffy_yyy dan zorobelikapalyyy dengan password zoro_yyy 

   **Jawaban**

---

## Nomor 10
   **Soal**

   Transaksi jual beli tidak dilakukan setiap hari, oleh karena itu akses internet dibatasi hanya dapat diakses setiap hari Senin-Kamis pukul 07.00-11.00 dan setiap hari Selasa-Jum’at pukul 17.00-03.00 keesokan harinya (sampai Sabtu pukul 03.00) 

   **Jawaban**

---

## Nomor 11
   **Soal**
   
   Setiap mengakses google.com, akan diredirect menuju super.franky.yyy.com dengan website yang sama pada soal shift modul 2. Web server super.franky.yyy.com berada pada node Skypie 

   **Jawaban**

---

## Nomor 12
   **Soal**
   
   Luffy bertugas untuk mendapatkan gambar (.png, .jpg), sedangkan Zoro mencari sisanya. Karena Luffy orangnya sangat teliti untuk mencari harta karun, ketika ia berhasil mendapatkan gambar, ia mendapatkan gambar dan melihatnya dengan kecepatan 10 kbps

   **Jawaban**

---

## Nomor 13
   **Soal**
   
   Sedangkan, Zoro yang sangat bersemangat untuk mencari harta karun, sehingga kecepatan kapal Zoro tidak dibatasi ketika sudah mendapatkan harta yang diinginkannya

   **Jawaban**

---

## Kendala

