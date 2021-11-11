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
   
      **Jipangu sebagai DHCP Server**
   
      <img src="https://github.com/Herwindams24/soalshift-3/blob/main/Image/editKonfigurasi_Jipangu.png?raw=true" width="500">
   
      **Water 7 sebagai Proxy Server**
   
      <img src="https://github.com/Herwindams24/soalshift-3/blob/main/Image/editKonfigurasi_Water7.png?raw=true" width="500">
    
      **EniesLobby sebagai DNS Server**
   
      <img src="https://github.com/Herwindams24/soalshift-3/blob/main/Image/editKonfigurasi_Jipangu.png?raw=true" width="500">
      
      **Loguetown dan Alabasta sebagai Client Side Switch 1**
      
      <img src="https://user-images.githubusercontent.com/57980125/141273010-0e4fde66-fb17-4677-9729-0ec78af04467.png" width="500">
      
      <img src="https://user-images.githubusercontent.com/57980125/141273252-87ab11eb-c546-4aca-b3ed-b3e982770fa8.png" width="500">
      
      **Skypie sebagai WebServer**
      
      <img src="https://user-images.githubusercontent.com/57980125/141273468-4a8b0e19-2acc-4793-8c16-08af97efeb94.png" width="500">
      
      **TottoLand sebagai Client Side Switch 1**
      
       <img src="https://user-images.githubusercontent.com/57980125/141273490-4c183666-e2d2-464c-9b3f-20c7b232f9af.png" width="500">
      
      
      
  2. Instalasi dan sebagainya akan dijelaskan pada jawaban soal berikutnya
      
   
  
---

## Nomor 02
   **Soal**
   
   dan Foosha sebagai DHCP Relay 

   **Jawaban**
   
   <img src="https://github.com/Herwindams24/soalshift-3/blob/main/Image/dhcp_relay.png?raw=true" width="500">
   
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
      
      <img src="https://github.com/Herwindams24/soalshift-3/blob/main/Image/file%20dhcpserver.png?raw=true" width="500">
      
   3. Agar DHCP Server dapat berjalan dan tidak error, perlu deklarasi subnet yang terkoneksi pada JIPANGU (subnet dari eth0 JIPANGU) pada /etc/dhcp/dhcpd.conf. Untuk subnet 2 tidak harus memiliki settingan dhcp.
      
      ```
      echo '
      subnet 192.212.2.0  netmask 255.255.255.248 {
      }' > /etc/dhcp/dhcpd.conf
      ```
  4. Setting DHCP server (Jipangu) agar subnet 1 mendapatkan range IP dari [prefix IP].1.20 - [prefix IP].1.99 dan [prefix IP].1.150 - [prefix IP].1.169. Di mana Prefix IP akan diisikan dengan `192.212` sesuai dengan Prefix yang digunakan oleh Kelemopok Penulis.
  
     <img src="https://github.com/Herwindams24/soalshift-3/blob/main/Image/iprange_switch1.png?raw=true" width="500">
       
---

## Nomor 04
   **Soal**
   
   Client yang melalui Switch3 mendapatkan range IP dari [prefix IP].3.30 - [prefix IP].3.50 
   
   **Jawaban**
   
   Sama halnya dengan soal nomor 03, settingan subnet 3 sebagai berikut:

   <img src="https://github.com/Herwindams24/soalshift-3/blob/main/Image/iprange_switch3.png?raw=true" width="500">
   
---

## Nomor 05
   **Soal**
   
   Client mendapatkan DNS dari EniesLobby dan client dapat terhubung dengan internet melalui DNS tersebut.
   
   **Jawaban**
   
   Pada settingan, tambahkan IP EniesLobby (192.212.2.2) pada options-domain-name-servers sebagai berikut:
   
   * Switch 1
   	
     <img src="https://github.com/Herwindams24/soalshift-3/blob/main/Image/dns_switch1.png?raw=true" width="500">
	
   * Switch 3
   
     <img src="https://github.com/Herwindams24/soalshift-3/blob/main/Image/dns_switch2.png?raw=true" width="500">
	
   Pada Client's Side
   * Loguetown
   
     <img src="https://github.com/Herwindams24/soalshift-3/blob/main/Image/Lease_Loguetown.png?raw=true" width="500">
     
   * Alabasta
   	
     <img src="https://github.com/Herwindams24/soalshift-3/blob/main/Image/Lease_Alabasta.png?raw=true" width="500">
     
   * TottoLand
   
     <img src="https://github.com/Herwindams24/soalshift-3/blob/main/Image/Lease_TotoLand.png?raw=true" width="500">
     
   * Skypie
   
     <img src="https://user-images.githubusercontent.com/57980125/141270428-6da4d4e1-816a-428a-b6a7-75237ace8e36.png" width="500">  

---

## Nomor 06
   **Soal**
   
   Lama waktu DHCP server meminjamkan alamat IP kepada Client yang melalui Switch1 selama 6 menit sedangkan pada client yang melalui Switch3 selama 12 menit. Dengan waktu maksimal yang dialokasikan untuk peminjaman alamat IP selama 120 menit.


   **Jawaban**

   Masih pada Settingan yang sama, hanya mengubah `default-lease-time` untuk durasi DHCP server meminjamkan alamat IP kepada Client dan `max-lease-time` atau Waktu maksimal yang di alokasikan untuk peminjaman IP oleh DHCP server ke client dalam satuan detik. Edit satuan menit pada soal menjadi satuan detik.
   
   * Switch 1
      
      <img src="https://user-images.githubusercontent.com/57980125/141270088-7353741b-423e-451e-a60f-e6e9e5bbd7ac.png" width="500">
      
   * Switch 2
     
      <img src="https://user-images.githubusercontent.com/57980125/141270136-50a5f77e-5c1c-40a0-8441-9254302a94d6.png" width="500">
      
---

## Nomor 07
   **Soal**
   
   Luffy dan Zoro berencana menjadikan Skypie sebagai server untuk jual beli kapal yang dimilikinya dengan alamat IP yang tetap dengan IP [prefix IP].3.69

   **Jawaban**
 
   <img src="https://user-images.githubusercontent.com/57980125/141264002-50f87360-e9bf-4c63-9d87-0dd561604fcd.png" width="500"> 

   Berikut tahapan-tahapan yang perlu dilakukan:
   * Pada Jipangu ketik `ip a` untuk mendapatkan atau melihat `hwaddress`
   * Ketikan script seperti pada gambar di atas di `/root/script.sh` milik Jipangu
   * Coba lakukan test pada Node Skypie, apakah Skypie telah menyewa tetap IP terssebut (192.212.3.69)
   
   <img src="https://user-images.githubusercontent.com/57980125/141264904-261b2870-9e6a-4545-a1ab-bd3f63520f66.png" width="500">

---

## Nomor 08
   **Soal**
   
   Pada Loguetown, proxy harus bisa diakses dengan nama jualbelikapal.yyy.com dengan port yang digunakan adalah 5000

   **Jawaban**

   1. Water 7

      *  Install dan Cek Status Squid
      		```
      	 	 echo 'nameserver 192.168.122.1'>/etc/resolv.conf
	 	    apt-get update
	 	    apt-get install squid -y
	 	    service squid status
         	```
      * Restart Squid
      * Konfigurasikan Squid Baru
      
    	 <img src="https://user-images.githubusercontent.com/57980125/141268294-9081c791-37a8-4fbd-9fe6-2248d99eb9e2.png" with="500">
	 
      * Restart Squid

   2. Loguetown
   
   Pada Loguetown hanya perlu mengaktifkan Proxy seperti pada gambar:
   
   <img src="https://user-images.githubusercontent.com/57980125/141266450-b734d95e-c1f8-47c0-b393-225434c2f8fa.png" width="400"> 

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
![image](https://user-images.githubusercontent.com/57520495/141327625-a2233900-b6d9-4372-826b-3b476728dd8d.png)

Keterangan:
1. `acl lan src 192.212.1.0/24 192.212.3.0/24` ACL bernama 'lan' yang berlaku untuk incoming request (source) yang berasal dari network 192.212.1.0 dan 192.212.3.0.
2. `acl badsites dstdomain .google.com` ACL bernama 'badsites' yang berlaku untuk request dengan domain tujuan (destination) google.com.
3. `deny_info http://super.franky.ti2.com lan` gunakan URL http://super.franky.ti2.com untuk ditampilkan kepada yang termasuk aturan ACL 'lan' saat ada aturan deny yang berjalan.
4. `http_reply_access deny badsites lan` deny akses sesuai isi dari ACL badsites (situs google) yang (sumber requestnya) sesuai dengan aturan pada ACL 'lan'.
5. `http_access allow USERS AVAILABLE_WORKING` allow akses http kepada user yang terauntetikasi dan memenuhi aturan pada ACL 'AVAILABLE_WORKING'.

Cara kerja singkat:
User dari network 192.212.1.0 dan 192.212.2.0 dan sudah terauntentikasi melakukan request dengan domain tujuan google.com -> request ditolak/diblokir (deny) -> tunjukkan informasi deny berupa situs http://super.franky.ti2.com -> secara tidak langsung sama dengan mengarahkan (redirect) ke situs tersebut 😁.

![image](https://user-images.githubusercontent.com/57520495/141327800-8ef68d74-e605-4333-b864-2bc4543ddf86.png)
![image](https://user-images.githubusercontent.com/57520495/141327746-1b67776b-e99c-46f1-91c3-c0409e96bae4.png)
![image](https://user-images.githubusercontent.com/57520495/141327703-97fb8446-e9f2-497f-b596-0a32ed97eefb.png)

---

## Nomor 12
   **Soal**
   
   Luffy bertugas untuk mendapatkan gambar (.png, .jpg), sedangkan Zoro mencari sisanya. Karena Luffy orangnya sangat teliti untuk mencari harta karun, ketika ia berhasil mendapatkan gambar, ia mendapatkan gambar dan melihatnya dengan kecepatan 10 kbps

   **Jawaban**
Aplikasikan aturan (rule) proxy pada `squid.conf` berikut ini:
![image](https://user-images.githubusercontent.com/57520495/141328448-1b7c9a21-2086-4bbb-8ef6-e0d2b7a3a5b3.png)
Keterangan:
1. `acl gambar url_regex -i \.png$ \.jpg$` Access Control List (ACL) bernama 'gambar' yang berisi URL dengan regular expression yang berlaku untuk semua request (apapun) dengan akhiran `.png` dan `.jpg`.
2. `acl akun proxy_auth luffybelikapalti2` ACL bernama 'akun' yang berlaku untuk akses proxy dengan autentikasi (username) luffybelikapalti2
3. `delay_pools 1` deklarasi sebuah (1) delay pools untuk mengaplikasikan aturan delay.
4. `delay_class 1 1` deklarasi sebuah class bernomor 1 dengan tipe/jenis class 1 (hanya mengatur overall bandwith saja).
5. `delay_parameters 1 1250/3200` deklarasi pengaturan bandwith pada class bernomor 1 sebesar 1250 B (Bytes) = 1.25 KB = 10 Kb (bit) saat sebuah request melewati burst limit sebesar 3200 Bytes*. 
6. `delay_access 1 allow gambar akun` mengaplikasikan (sekaligus men-allow) aturan delay kepada ACL 'gambar' dan 'akun'.
7. `delay_access 1 deny ALL` "tidak mengaplikasikan" aturan delay pada seluruh akses kecuali yang di-allow.
8. `http_access deny ALL` deny semua akses http (karena ini merupakan akhir dari konfigurasi) selain yang di-allow, berhubungan dengan nomor 9 yang `http_access allow USERS AVAILABLE_WORKING`

Test download file yang sama menggunakan autentikasi proxy Luffy:
![image](https://user-images.githubusercontent.com/57520495/141328237-f4462942-dae0-4fd5-bab1-16707fc53808.png)

---

## Nomor 13
   **Soal**
   
   Sedangkan, Zoro yang sangat bersemangat untuk mencari harta karun, sehingga kecepatan kapal Zoro tidak dibatasi ketika sudah mendapatkan harta yang diinginkannya

   **Jawaban**

Mengaplikasikan aturan yang diaplikasikan pada nomor 12.

Test download file yang sama menggunakan autentikasi proxy zoro:
![image](https://user-images.githubusercontent.com/57520495/141328107-735ff85b-1af4-4663-9a19-98d4283c0744.png)

---

## Kendala

