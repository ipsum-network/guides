RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'

echo -e "
Welcome to your firewall installation script for IPS Masternode.

I will download the firewall rules for you, then install the firewall.
You will be asked if you want the firewall to be started at boot time:
${RED}answer "no"${NC}

I insist:
${RED} _______________
/   Answer no   \\
\\_______________/${NC}
Otherwise your masternode would get disconnected and you would have to
wait rewards as if you had restarted your masternode.
You definitely don't want this...

No worry I will make your firewall start at boot time later.


Also don't try to login more than 5 times in a 2 minutes row to your vps,
you would be locked out for a short period of time.
If you do however just be patient, you should be able to connect again in
a few minutes...

And now for something totally different!

Enjoy!
"

sleep 30

echo -e 'Now let me download the firewall configuration file for ${PURPLE}IPS${NC}.'


wget -O /tmp/ferm.conf https://raw.githubusercontent.com/grnt4v/guides/master/scripts/firewall/ferm.conf 2>/dev/null

echo -e "I'm installing your ${GREEN}firewall${NC}..."
echo -e "Don't forget to answer ${RED}no${NC} to the next question!"
echo -e "When ready press <enter>"
sleep 15
apt-get update > /dev/null
apt-get install -y ferm

mv /tmp/ferm.conf /etc/ferm/ferm.conf

ferm /etc/ferm/ferm.conf

sed -i 's/^ENABLED=.*$/ENABLED="yes"/' /etc/default/ferm

echo "Relax, your firewall is now installed!"
echo -e "Happy crypto with ${PURPLE}IPS${NC}!"
