#/bin/bash

cd ~
echo "****************************************************************************"
echo "****************************************************************************"
echo "*****************************CryptoNeverSleeps******************************"
echo "****************************************************************************"
echo "****************************************************************************"
echo "********************This script was forked from XeZZoR**********************"
echo "****************************************************************************"
echo "* Ubuntu 16.04 is the recommended opearting system for this install.       *"
echo "*                                                                          *"
echo "* This script will install and configure your IPSUM Coin Masternode.      *"
echo "****************************************************************************"
echo && echo && echo
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!                                                 !"
echo "! Make sure you double check before hitting enter !"
echo "!                                                 !"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo && echo && echo

echo "Do you want to install all needed dependencies (no if you did it before)? [y/n]"
read DOSETUP

if [[ $DOSETUP =~ "y" ]] ; then
  sudo apt-get update
  sudo apt-get -y upgrade
  sudo apt-get -y dist-upgrade
  sudo apt autoremove -y
  sudo apt-get install -y nano htop git
  sudo apt-get install -y software-properties-common
  sudo apt-get install -y build-essential libtool autotools-dev pkg-config libssl-dev
  sudo apt-get install -y libboost-all-dev
  sudo apt-get install -y libevent-dev
  sudo apt-get install -y libminiupnpc-dev
  sudo apt-get install -y autoconf
  sudo apt-get install -y automake unzip
  sudo add-apt-repository  -y  ppa:bitcoin/bitcoin
  sudo apt-get update
  sudo apt-get install -y libdb4.8-dev libdb4.8++-dev libminiupnpc-dev libevent-dev

  cd /var
  sudo touch swap.img
  sudo chmod 600 swap.img
  sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=3000
  sudo mkswap /var/swap.img
  sudo swapon /var/swap.img
  sudo free
  sudo echo "/var/swap.img none swap sw 0 0" >> /etc/fstab
  cd
  
fi 
cd ~
sudo ./ips-cli -daemon stop
echo "! Stopping IPS Daemon !"

echo "! Removing IPS !"
sudo rm -f ipsd
sudo rm -f ips-cli
sudo rm -f ips-qt

wget https://github.com/ipsum-network/ips/releases/download/v3.1.0.0/ips-3.1.0-linux.tar.gz
tar xvzf ips-3.1.0-linux*.tar.gz

cd ips-3.1.0/bin/

./ipsd