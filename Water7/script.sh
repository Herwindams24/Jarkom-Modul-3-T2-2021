###-No8-------------------Setting Proxy Server di Water7-------------------###
echo 'nameserver 192.168.122.1'>/etc/resolv.conf
apt-get update
apt-get install squid

# proxy server
# instalasi squid
apt-get install squid
service squid status

# backup konfig template squid
mv /etc/squid/squid.conf /etc/squid/squid.conf.bak

# konfigurasikan squid baru 
echo 'http_port 5000
visible_hostname jualbelikapal.ti2.com
' > /etc/squid/squid.conf

# restart squid
service squid restart

## Pengaktifan dimulai dari client terlebih dahulu (Loguetown) ##

## Perbaharui konfigurasi squid.conf agar dapat mengakses proxy via http
echo 'http_access allow all' >> /etc/squid/squid.conf

# restart squid
service squid restart
###-No8-------------------Setting Proxy Server di Water7-------------------###

###-No9---------------------Otentikasi MD5 2 Username-----------------------###
# Instalasi apache2-utils
apt-get update
apt-get install -y apache2-utils

## buat username dan password baru pada /etc/squid/passwd dengan username 
## gunakan command khusus -m agar defaultnya dalam MD5 (APR1-MD5)
# username luffybelikapalti2 dan password luffy_ti2
htpasswd -m -b -c /etc/squid/passwd luffybelikapalti2 luffy_ti2

# username zorobelikapalti2 dan password zoro_ti2
htpasswd -m -b /etc/squid/passwd zorobelikapalti2 zoro_ti2

## Perbaharui konfigurasi squid dengan autentikasi
echo 'http_port 5000
visible_hostname jualbelikapal.ti2.com

auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/passwd
auth_param basic children 5
auth_param basic realm Proxy
auth_param basic credentialsttl 2 hours
auth_param basic casesensitive on
acl USERS proxy_auth REQUIRED
http_access allow USERS' > /etc/squid/squid.conf

# restart squid
service squid restart
###-No9---------------------Otentikasi MD5 2 Username-----------------------###

###-No10-------------Pembatasan transaksi jual beli akses waktu-------------###
## buat file acl untuk pembatasan waktu senin-kamis MTWH 07:00-11:00
## pembatasan waktu selasa-jumat TWHF 17:00-23:59
## pembatasan waktu keesekoan harinya hingga sabtu WHFA 00:00-03:00 
echo 'acl AVAILABLE_WORKING time MTWH 07:00-11:00
acl AVAILABLE_WORKING time TWHF 17:00-23:59
acl AVAILABLE_WORKING time WHFA 00:00-03:00' > /etc/squid/acl.conf

## perbarui konfigurasi squid.conf nya pembatasan waktu akses
echo 'http_port 5000
visible_hostname jualbelikapal.ti2.com
include /etc/squid/acl.conf

auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/passwd
auth_param basic children 5
auth_param basic realm Proxy
auth_param basic credentialsttl 2 hours

auth_param basic casesensitive on
acl USERS proxy_auth REQUIRED
http_access allow USERS AVAILABLE_WORKING
http_access deny all' > /etc/squid/squid.conf

# restart squid
service squid restart

###-No10-------------Pembatasan transaksi jual beli akses waktu-------------###
