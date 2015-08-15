# Secure Memcached
iptables -A INPUT -s 127.0.0.1 -p tcp --destination-port 11211 -j ACCEPT
iptables -A INPUT -s 0.0.0.0/0 -p tcp --destination-port 11211 -j DROP
