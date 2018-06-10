#! /bin/bash

cd /tmp

wget https://github.com/grnt4v/guides/tree/master/scripts/firewall/ferm.conf

apt update
apt install -y ferm

mv ferm.conf /etc/ferm/ferm.conf

ferm -i /etc/ferm/ferm.conf
