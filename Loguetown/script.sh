apt-get update
apt-get install lynx

echo '\
auto eth0
iface eth0 inet dhcp' > /etc/network/interfaces
## pastikan DNS server sesuai keinginan dalam kali ini dengan cloudflare
cat /etc/resolv.conf


###-No8-----Testing Proxy jualbelikapal.ti2.com port 5000 di Loguetown-----###
### Aktifkan Proxy
# mengarah ke IP Water7
export http_proxy=http://192.212.2.3:5000

# untuk lihat generated by jualbelikapal.ti2.com atau hostnamenya
# ke water7 dulu dan comment echo 'http_access allow all'
# lynx google.com
# untuk lihat generated by jualbelikapal.ti2.com atau hostnamenya
# ke water7 dulu dan comment echo 'http_access allow all'
# lynx google.com

###-No8-----Testing Proxy jualbelikapal.ti2.com port 5000 di Loguetown-----###

###--------------------No 09 esting Otentikasi MD5 2 Username-----------------
# username luffybelikapalti2 dan password luffy_ti2
# lynx google.com 

# username zorobelikapalti2 dan password zoro_ti2
# lynx google.com

###--------------------No 09 esting Otentikasi MD5 2 Username-----------------

##-------------------------No 10 Testing Pembatasan Waktu----------------------
# ubah datesnya dulu
# contoh untuk hari senin
# date --set"2021-11-08 08:05:59.990"
# contoh untuk hari selasa sore
# date --set"2021-11-09 18:00:00"
# contoh untuk hari sabtu dini hari
# date --set"2021-11-13 02:00:00"
# lynx google.com
# username luffybelikapalti2 dan password luffy_ti2
##-------------------------No 10 Testing Pembatasan Waktu----------------------