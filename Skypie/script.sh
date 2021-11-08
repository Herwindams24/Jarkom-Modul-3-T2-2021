## konfigurasi interface Skypie
echo '\
auto eth0
iface eth0 inet dhcp
hwaddress ether  ca:85:61:e5:2d:0f' > /etc/network/interfaces
## pastikan DNS server
cat /etc/resolv.conf

###-----------------------No 11 Web Server Super Franky-----------------------###
## Update Linux
apt-get update

## Instalasi lynx
apt-get install lynx -y

## Instalasi dan mulai apache 
apt-get install apache2 -y
service apache2 start

## Instalasi dan Cek php
apt-get install php -y
php -v

# download unzip
apt-get install unzip
# download wget
apt-get install wget

# Inisialisasi DocumentRoot pada /var/www/super.franky.ti2.com
echo "\
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/super.franky.ti2.com
        ServerName super.franky.ti2.com
        ServerAlias www.super.franky.ti2.com
        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" > /etc/apache2/sites-available/super.franky.ti2.com.conf
         
a2ensite super.franky.ti2.com
# buat direktori franky di /var/www
mkdir /var/www/super.franky.ti2.com

service apache2 restart

# download super.franky.zip
wget https://raw.githubusercontent.com/FeinardSlim/Praktikum-Modul-2-Jarkom/mai$

# proses unzip
unzip /root/super.franky.zip 

# hapus file zip
# pindahkan ke /var/www/super.franky.ti2.com kontennya
mv super.franky/* /var/www/super.franky.ti2.com/

# hapus folder super.franky
rm -r super.franky/

# Aktifkan Directory Listing  pada /var/www/super.franky.ti2.com/public
echo "\
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/super.franky.ti2.com
        ServerName super.franky.ti2.com
        ServerAlias www.super.franky.ti2.com
        <Directory /var/www/super.franky.ti2.com/public>
                Options +Indexes
        </Directory>
        <Directory /var/www/super.franky.ti2.com>
                Options +FollowSymLinks -Multiviews
AllowOverride All
        </Directory>
        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" > /etc/apache2/sites-available/super.franky.ti2.com.conf

# restart apache2
service apache2 restart

# redirect IP Skypie 192.212.3.69 ke super.franky.ti2.com
a2enmod rewrite

# restart apache2
service apache2 restart

###---------------------NO 11 END HERE-----------------------###