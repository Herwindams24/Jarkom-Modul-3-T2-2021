###------------------------No 2 DHCP RELAY FOOSHA ----------------
## Persiapan dhcp relay
apt-get update
apt-get install isc-dhcp-relay

## Setting sysctl untuk Ip Forwarding
echo 'net.ipv4.ip_forward=1' > /etc/sysctl.conf
sysctl -p

## edit konfigurasi isc-dhcp-relay dengan server di jipangu 
echo '
SERVERS="192.212.2.4"
INTERFACES="eth1 eth2 eth3"
' > /etc/default/isc-dhcp-relay

## restart service isc-dhcp-relay
service isc-dhcp-relay restart

###------------------------- No 02 END HERE ------------------
