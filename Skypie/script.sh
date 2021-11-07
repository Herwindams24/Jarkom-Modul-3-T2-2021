echo '\
auto eth0
iface eth0 inet dhcp
hwaddress ether  ca:85:61:e5:2d:0f' > /etc/network/interfaces
## pastikan DNS server sesuai keinginan dalam kali ini dengan cloudflare
cat /etc/resolv.conf