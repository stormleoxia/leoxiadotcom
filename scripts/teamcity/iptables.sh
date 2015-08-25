#!/bin/sh

# Secure Memcached
iptables -A INPUT -p tcp --destination-port 8111 -j ACCEPT
iptables -A INPUT -p tcp -s 127.0.0.1 --destination-port 9090 -j ACCEPT
