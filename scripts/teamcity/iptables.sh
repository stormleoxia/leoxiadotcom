#!/bin/sh

# Secure Memcached
iptables -A INPUT -p https --destination-port 8111 -j ACCEPT
