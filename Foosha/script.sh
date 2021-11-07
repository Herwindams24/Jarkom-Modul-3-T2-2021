#-------------------------------KRITERIA----------------------------------------------
## Persiapan 
apt-get update
apt-get install isc-dhcp-server 
dhcpd --version

## pemilihan interfaces
echo 'INTERFACES="eth1 eth3"' > /etc/default/isc-dhcp-server
##echo 'INTERFACE="eth3"' >> /etc/default/isc-dhcp-server

## setting parameter jaringan DHCP
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
}' > /etc/dhcp/dhcpd.conf

### Switch 3 (Lotto, Skypie)
echo '
subnet 192.212.3.0  netmask 255.255.255.0 {
    range 192.212.3.30 192.212.3.50;
    option routers 192.212.3.1;
    option broadcast-address 192.212.1.255;
    option domain-name-servers 192.212.2.2;
    default-lease-time 720;
    max-lease-time 7200;
}' >> /etc/dhcp/dhcpd.conf

## restart isc-dhcp-server
service isc-dhcp-server restart

## cek status isc-dhcp-server
service isc-dhcp-server status


