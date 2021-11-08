echo '\
auto eth0
iface eth0 inet dhcp
hwaddress ether  ca:85:61:e5:2d:0f' > /etc/network/interfaces
## pastikan DNS server sesuai keinginan dalam kali ini dengan cloudflare
cat /etc/resolv.conf

cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/super.franky.ti2.com.conf

echo
'<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/super.franky.ti2.com
        ServerName super.franky.ti2.com
        ServerAlias www.super.franky.ti2.com

        <Directory /var/www/super.franky.ti2.com>
             Options +Indexes
        </Directory>
         ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>' > /etc/apache2/sites-available/super.franky.ti2.com.conf

a2ensite super.franky.ti2.com
service apache2 restart

#apt-get install wget -y
#apt-get install unzip -y
#wget https://raw.githubusercontent.com/FeinardSlim/Praktikum-Modul-2-Jarkom/ma$
#unzip /var/www/super.franky.zip -d /var/www/

#service apache2 restart