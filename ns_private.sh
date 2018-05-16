#!/usr/bin/env bash

# Establishes an IPsec Virtual Private Network (free-nl.hide.me)
# in a separate Linux Network Namespace.
#    = you can still use your normal internet connection in parallel
#    = resource friendly (as opposed to a VM)
#    = usability
#
# Self-check in scripts:
#    $( ip netns identify $$ ) == ${NS}



set -e
# set -x


NS="ns_private"
IF_REAL="wlan0"
IP_NONUSED_OCTET=200  # 0-255


IF_VETH="v${IF_REAL}"
IF_VETH_NS="${IF_VETH}-ns"
IP_VETH="10.${IP_NONUSED_OCTET}.1.1"
IP_VETH_NS="10.${IP_NONUSED_OCTET}.1.2"
IP_VETH_NET="10.${IP_NONUSED_OCTET}.1.0"


netns_stop_services()
{
	echo "Stopping services in network namespace ${NS}..."
	# Kill together with namespace
}


netns_stop()
{
	echo "Tearing down network namespace ${NS}..."
	
	ip netns pids ${NS} | ifne xargs kill
	ip link  del ${IF_VETH}
	ip netns del ${NS}
	
	mkdir -p /etc/netns/${NS}                      # NS-own configuration files (otherwise uses /etc)
	cp --force /etc/resolv.conf /etc/netns/${NS}/  # IPsec needs to resolve VPN server address before adding own name servers
}


netns_start()
{
	echo "Setting up network namespace ${NS}..."

	# Create namespace. Check: ip netns list
	# Creates a mount point in /var/run/netns/
	#
	ip netns add ${NS}
	
	
	# We use virtual interface pairs as assigning a physical link to a NS
	# would make it unusable in another NS. Check: ip link list
	#
	ip link add ${IF_VETH} type veth peer name ${IF_VETH_NS}
	
	
	# Assign the virtual interface to a NS:
	#
	ip link set ${IF_VETH_NS} netns ${NS}
	
	
	# Bring device up here:
	#
	ip addr add ${IP_VETH}/24 dev ${IF_VETH}
	ip link set ${IF_VETH} up
	
	
	# Bring devices up there:
	#
	ip netns exec ${NS} ip addr add ${IP_VETH_NS}/24 dev ${IF_VETH_NS}
	ip netns exec ${NS} ip link set ${IF_VETH_NS} up
	ip netns exec ${NS} ip link set lo up
	
	
	# Make all external traffic leaving $NS to go through $IF_VETH
	#
	ip netns exec ${NS} ip route add default via ${IP_VETH}
	echo 1 > /proc/sys/net/ipv4/ip_forward
	
	#readonly dropchain=LOGDROP
	#iptables -N ${dropchain}
	#iptables -A ${dropchain} -m limit --limit 2/min -j LOG --log-prefix Packet Dropped:  --log-level 7
	#iptables -A ${dropchain} -j DROP
	
	iptables --policy FORWARD ${dropchain:-DROP}
	iptables --flush  FORWARD
	iptables -t nat --flush
	iptables -t nat -A POSTROUTING -s ${IP_VETH_NET}/24 -o ${IF_REAL} -j MASQUERADE
	
	# wan -> private
	iptables -A FORWARD -i ${IF_REAL} -o ${IF_VETH} -j ACCEPT
	
	# wan <- private (minimum ports for StrongSWAN/IPsec)
	iptables -A FORWARD -o ${IF_REAL} -i ${IF_VETH} -p icmp                                 -j ACCEPT  # 
	iptables -A FORWARD -o ${IF_REAL} -i ${IF_VETH} -p udp -m multiport --dport 53,500,4500 -j ACCEPT  # DNS (find hide.me), IKE/ISAKMP (Internet Key Exchange), ?
	iptables -A FORWARD -o ${IF_REAL} -i ${IF_VETH} -p tcp -m multiport --dport 53,10000    -j ACCEPT  # DNS (find hide.me), ?
	iptables -A FORWARD -o ${IF_REAL} -i ${IF_VETH} -p 50                                   -j ACCEPT  # IPsec ESP protocol (Encapsd Sec Payload)
	iptables -A FORWARD -o ${IF_REAL} -i ${IF_VETH} -p 51                                   -j ACCEPT  # IPsec AH  protocol (Authn Header)
	readonly http_rule="-o ${IF_REAL} -i ${IF_VETH} -p tcp -m multiport --dport 80,443      -j ACCEPT"
	iptables -A FORWARD ${http_rule}   # for OCSP (Online Certificate Status Protocol) 
	                                   # disable = /etc/strongswan.d/charon/revocation.conf: load=no
}


netns_start_services()
{
	echo "Starting services in namespace ${NS}..."

	# Start VPN
	#
	ip netns exec ${NS} ipsec restart
	sleep 5s
	ip netns exec ${NS} ipsec up hide-nl
	sleep 5s
	iptables -D FORWARD ${http_rule}   # HTTP was for OSCP only, no other prg should HTTP outside IPsec
}


case "$1" in
	'stop')
		netns_stop_services
		sleep 2
		netns_stop
		;;
	'restart')
		netns_stop_services 
		sleep 2
		netns_stop
		sleep 2
		netns_start \
		&& sleep 2  \
		&& netns_start_services
		;;
	*)
		# Default is "start", for backwards compatibility with previous
		# Slackware versions. This may change to a 'usage' error someday.
		#
		if ip netns | grep -q ${NS}
		then
			echo "Namespace \"${NS}\" already exists. Use 'stop' or 'restart' argument."
			exit 1
		fi
		
		netns_start \
		&& sleep 2  \
		&& netns_start_services
esac

