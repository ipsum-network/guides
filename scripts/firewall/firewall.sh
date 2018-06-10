RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'

clear

echo -e "Welcome to your ${GREEN}firewall installation script${NC} for ${PURPLE}IPS${NC} Masternode."

sleep 3

echo -e "
If asked if you want to ${RED}enable ferm on bootup${NC}:
answer ${RED}No${NC}
"

wget -O /tmp/ferm.conf https://raw.githubusercontent.com/grnt4v/guides/master/scripts/firewall/ferm.conf 2>/dev/null

apt-get update > /dev/null
sleep 5
clear
apt-get install -y ferm

mv /tmp/ferm.conf /etc/ferm/ferm.conf

ferm /etc/ferm/ferm.conf

sed -i 's/^ENABLED=.*$/ENABLED="yes"/' /etc/default/ferm

clear

echo -e "Relax, ${GREEN}your firewall is now installed${NC}!"
echo
echo -e "Happy crypto with ${PURPLE}IPS${NC}!"
sleep 2
echo
