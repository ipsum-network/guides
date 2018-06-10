#! /bin/bash

cat << EOF
Welcome to your firewall installation script for IPS Masternode.

I will download the firewall rules for you, then install the firewall.
You will be asked if you want the firewall to be started at boot time:
answer "no"

I insist:
 _______________
/   Answer no   \\
\\_______________/
Otherwise your masternode would get disconnected and you would have to
wait rewards as if you had restarted your masternode.
You definitely don't want this...

No worry I will make your firewall start at boot time later.


Also don't try to login more than 5 times in a 2 minutes row to your vps,
you would be locked out for a short period of time.
If you do however just be patient, you should be able to connect again in
a few minutes...

And now for something totally different!

Hit <return> and enjoy!
EOF

read a
read a

wget -O /tmp/ferm.conf https://raw.githubusercontent.com/grnt4v/guides/master/scripts/firewall/ferm.conf

apt update
apt install -y ferm

mv /tmp/ferm.conf /etc/ferm/ferm.conf

ferm /etc/ferm/ferm.conf

sed -i 's/^ENABLED=.*$/ENABLED="yes"/' /etc/default/ferm

echo "You should feel better now as your firewall has been installed!"
echo "Happy crypto!"
