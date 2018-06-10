#! /bin/bash

cd /tmp

wget https://raw.githubusercontent.com/grnt4v/guides/master/scripts/firewall/ferm.conf

apt update
apt install -y ferm

mv ferm.conf /etc/ferm/ferm.conf

# ferm /etc/ferm/ferm.conf
