echo '\
auto eth0
iface eth0 inet dhcp' > /etc/network/interfaces
## pastikan DNS server sesuai keinginan dalam kali ini dengan cloudflare
cat /etc/resolv.conf