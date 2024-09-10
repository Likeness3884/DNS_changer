#!/usr/bin/env dash

dns_servers_name="
    Default
    Shecan
    Electro
    Begzar
    403
    Radar
    Google
    CloudFlare
"
dns_servers="
	0,
    178.22.122.100 185.51.200.2,
    78.157.42.101 78.157.42.101,
    185.55.226.26 185.55.225.25,
    10.202.10.202 10.202.10.102,
    10.202.10.10 10.202.10.11,
    8.8.8.8 8.8.4.4,
    1.1.1.1 1.0.0.1
"

connection_name=$(nmcli -t -f NAME connection show --active | sed q1)
default_dns=$(nmcli -g ipv4.dns connection show "${connection_name}")

echo "Connection name: ${connection_name}"
if [ -z $default_dns ]; then
	echo "DNS is not set!"
else
	echo "DNS set: ${default_dns}"
fi
echo

ind=1
for dns in $dns_servers_name; do
	echo ${ind}. $dns
	ind=$((ind+1))
done
echo -n "enter the index: "
read ind

if [ $ind = 1 ]; then
	echo "Nothing changed."
	exit
fi

dns_name=$(echo $dns_servers_name | cut -d ' ' -f$ind)
dns_ip=$(echo $dns_servers | cut -d ',' -f$ind)

echo "You selected: $dns_name"
echo "DNS IPs: $dns_ip"

nmcli connection modify "${connection_name}" ipv4.dns "$dns_ip"
nmcli connection down "${connection_name}"
nmcli connection up "${connection_name}"
echo -e "Operation was successful."

