RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'

clear

echo -e "Welcome to your ${GREEN}firewall installation script${NC} for ${PURPLE}IPS${NC} Masternode."

sleep 2

echo -e "
You are going to be asked if you want to ${RED}enable ferm on bootup${NC}:
answer ${RED}No${NC}
"

#echo -e 'Now let me download the firewall configuration file for ${PURPLE}IPS${NC}.'

wget -O /tmp/ferm.conf https://raw.githubusercontent.com/grnt4v/guides/master/scripts/firewall/ferm.conf 2>/dev/null
sleep 10
clear
echo -e "I insist answer ${RED}No${NC} to the next question!"

sleep 4

apt-get update > /dev/null
apt-get install -y ferm

mv /tmp/ferm.conf /etc/ferm/ferm.conf

ferm /etc/ferm/ferm.conf

sed -i 's/^ENABLED=.*$/ENABLED="yes"/' /etc/default/ferm

clear

echo "Relax, your firewall is now installed!"
echo
echo -e "Happy crypto with ${PURPLE}IPS${NC}!"
