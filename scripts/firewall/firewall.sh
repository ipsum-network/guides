#! /bin/bash



wget -O /tmp/ferm.conf https://raw.githubusercontent.com/grnt4v/guides/master/scripts/firewall/ferm.conf

apt update
apt install -y ferm

mv /tmp/ferm.conf /etc/ferm/ferm.conf

# ferm /etc/ferm/ferm.conf
