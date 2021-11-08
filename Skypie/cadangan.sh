


# instalasi libapache2-mod-php7.0 biar bisa php ama htmlnya
apt-get install libapache2-mod-php7.0
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

# aktifkan konfigurasi dari franky.ti2.com
a2ensite super.franky.ti2.com.conf

# buat direktori franky di /var/www
mkdir /var/www/super.franky.ti2.com

# restart apache2
service apache2 restart

# download super.franky.zip
wget https://github.com/FeinardSlim/Praktikum-Modul-2-Jarkom/raw/main/super.fra$

# proses unzip
unzip /root/super.franky.zip 

# hapus file zip
rm /root/super.franky.zip

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
        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" > /etc/apache2/sites-available/super.franky.ti2.com.conf

# restart apache2
service apache2 restart

###-No11---------------------Web Server Super Franky-----------------------###
