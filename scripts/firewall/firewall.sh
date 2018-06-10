RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'

clear

echo -e "Welcome to your firewall installation script for IPS Masternode."

sleep 2

echo -e "
You will be asked if you want the firewall to be started at boot time:
${RED}answer "no"${NC}

I insist
${RED}Answer no to the following question${NC}
"

#echo -e 'Now let me download the firewall configuration file for ${PURPLE}IPS${NC}.'

wget -O /tmp/ferm.conf https://raw.githubusercontent.com/grnt4v/guides/master/scripts/firewall/ferm.conf 2>/dev/null
sleep 10
clear
echo -e "I'm installing your ${GREEN}firewall${NC}..."
echo -e "Don't forget to answer ${RED}no${NC} to the next question!"

sleep 8

apt-get update > /dev/null
apt-get install -y ferm

mv /tmp/ferm.conf /etc/ferm/ferm.conf

ferm /etc/ferm/ferm.conf

sed -i 's/^ENABLED=.*$/ENABLED="yes"/' /etc/default/ferm

echo "Relax, your firewall is now installed!"
echo -e "Happy crypto with ${PURPLE}IPS${NC}!"
