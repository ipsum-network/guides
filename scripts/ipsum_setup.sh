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

  sudo apt-get install -y ufw
  sudo ufw allow 22332
  sudo ufw allow ssh/tcp
  sudo ufw limit ssh/tcp
  sudo ufw logging on
  echo "y" | sudo ufw enable
  sudo ufw status

  mkdir -p ~/bin
  echo 'export PATH=~/bin:$PATH' > ~/.bash_aliases
  source ~/.bashrc
fi

wget https://github.com/ipsum-network/ips/releases/download/v3.1.0.0/ips-3.1.0-linux.tar.gz
tar xvzf ips-3.1.0-linux*.tar.gz

echo ""
echo "Configure your masternodes now!"
echo "Type the IP of this server, followed by [ENTER]:"
read IP

echo ""
echo "Enter masternode private key for node $ALIAS"
read PRIVKEY

CONF_DIR=~/.ips/
CONF_FILE=ips.conf
PORT=22331

mkdir -p $CONF_DIR
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> $CONF_DIR/$CONF_FILE
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> $CONF_DIR/$CONF_FILE
echo "rpcallowip=127.0.0.1" >> $CONF_DIR/$CONF_FILE
echo "rpcport=22332" >> $CONF_DIR/$CONF_FILE
echo "listen=1" >> $CONF_DIR/$CONF_FILE
echo "server=1" >> $CONF_DIR/$CONF_FILE
echo "daemon=1" >> $CONF_DIR/$CONF_FILE
echo "staking=1" >> $CONF_DIR/$CONF_FILE
echo "txindex=1" >> $CONF_DIR/$CONF_FILE
echo "logtimestamps=1" >> $CONF_DIR/$CONF_FILE
echo "masternode=1" >> $CONF_DIR/$CONF_FILE
echo "addnode=167.99.234.180" >> $CONF_DIR/$CONF_FILE
echo "addnode=198.199.96.58" >> $CONF_DIR/$CONF_FILE
echo "addnode=159.65.67.167" >> $CONF_DIR/$CONF_FILE
echo "addnode=167.99.155.35" >> $CONF_DIR/$CONF_FILE
echo "addnode=185.121.139.157" >> $CONF_DIR/$CONF_FILE
echo "addnode=194.67.195.147" >> $CONF_DIR/$CONF_FILE
echo "addnode=94.177.201.230" >> $CONF_DIR/$CONF_FILE
echo "addnode=45.77.23.168" >> $CONF_DIR/$CONF_FILE
echo "addnode=144.76.186.55" >> $CONF_DIR/$CONF_FILE
echo "addnode=144.76.186.56" >> $CONF_DIR/$CONF_FILE
echo "addnode=139.99.113.246" >> $CONF_DIR/$CONF_FILE
echo "addnode=139.99.113.247" >> $CONF_DIR/$CONF_FILE
echo "addnode=139.99.98.157" >> $CONF_DIR/$CONF_FILE
echo "addnode=139.99.38.113" >> $CONF_DIR/$CONF_FILE
echo "addnode=139.99.38.114" >> $CONF_DIR/$CONF_FILE
echo "addnode=144.202.57.180" >> $CONF_DIR/$CONF_FILE
echo "addnode=173.212.225.221" >> $CONF_DIR/$CONF_FILE
echo "addnode=185.220.121.247" >> $CONF_DIR/$CONF_FILE
echo "addnode=35.185.2.50" >> $CONF_DIR/$CONF_FILE
echo "addnode=188.166.118.9" >> $CONF_DIR/$CONF_FILE
echo "addnode=51.15.232.225" >> $CONF_DIR/$CONF_FILE
echo "addnode=51.15.225.60" >> $CONF_DIR/$CONF_FILE
echo "addnode=188.25.103.55" >> $CONF_DIR/$CONF_FILE
echo "addnode=198.13.62.116" >> $CONF_DIR/$CONF_FILE
echo "addnode=194.182.82.178" >> $CONF_DIR/$CONF_FILE
echo "addnode=45.76.166.121" >> $CONF_DIR/$CONF_FILE
echo "addnode=144.168.44.229" >> $CONF_DIR/$CONF_FILE
echo "addnode=45.76.33.250" >> $CONF_DIR/$CONF_FILE
echo "addnode=149.28.96.193" >> $CONF_DIR/$CONF_FILE
echo "addnode=35.196.130.190" >> $CONF_DIR/$CONF_FILE
echo "addnode=159.89.116.47" >> $CONF_DIR/$CONF_FILE
echo "addnode=46.166.139.73" >> $CONF_DIR/$CONF_FILE
echo "addnode=46.166.139.95" >> $CONF_DIR/$CONF_FILE
echo "addnode=45.32.21.74" >> $CONF_DIR/$CONF_FILE
echo "addnode=149.28.27.230" >> $CONF_DIR/$CONF_FILE
echo "addnode=149.28.23.219" >> $CONF_DIR/$CONF_FILE
echo "addnode=140.82.43.191" >> $CONF_DIR/$CONF_FILE
echo "addnode=40.121.194.132" >> $CONF_DIR/$CONF_FILE
echo "addnode=138.91.121.171" >> $CONF_DIR/$CONF_FILE
echo "addnode=45.32.221.232" >> $CONF_DIR/$CONF_FILE
echo "addnode=149.28.173.153" >> $CONF_DIR/$CONF_FILE
echo "addnode=107.191.50.171" >> $CONF_DIR/$CONF_FILE
echo "addnode=185.121.139.157" >> $CONF_DIR/$CONF_FILE
echo "addnode=45.22.221.131" >> $CONF_DIR/$CONF_FILE
echo "addnode=144.202.28.53" >> $CONF_DIR/$CONF_FILE
echo "addnode=45.76.253.201" >> $CONF_DIR/$CONF_FILE
echo "addnode=144.202.28.144" >> $CONF_DIR/$CONF_FILE
echo "addnode=149.28.102.150" >> $CONF_DIR/$CONF_FILE
echo "addnode=144.202.23.78" >> $CONF_DIR/$CONF_FILE
echo "addnode=144.202.22.172" >> $CONF_DIR/$CONF_FILE
echo "addnode=144.202.23.187" >> $CONF_DIR/$CONF_FILE
echo "addnode=149.28.121.45" >> $CONF_DIR/$CONF_FILE
echo "addnode=217.69.0.88" >> $CONF_DIR/$CONF_FILE
echo "addnode=217.69.0.114" >> $CONF_DIR/$CONF_FILE
echo "addnode=159.65.135.91" >> $CONF_DIR/$CONF_FILE
echo "addnode=207.148.77.233" >> $CONF_DIR/$CONF_FILE
echo "addnode=108.61.162.217" >> $CONF_DIR/$CONF_FILE
echo "addnode=207.148.97.65" >> $CONF_DIR/$CONF_FILE
echo "addnode=207.148.122.106" >> $CONF_DIR/$CONF_FILE
echo "addnode=245.77.177.38" >> $CONF_DIR/$CONF_FILE
echo "addnode=104.238.183.17" >> $CONF_DIR/$CONF_FILE
echo "addnode=207.148.116.69" >> $CONF_DIR/$CONF_FILE
echo "addnode=45.76.220.103" >> $CONF_DIR/$CONF_FILE
echo "addnode=45.32.242.137" >> $CONF_DIR/$CONF_FILE
echo "addnode=199.247.1.16" >> $CONF_DIR/$CONF_FILE
echo "addnode=149.28.37.122" >> $CONF_DIR/$CONF_FILE
echo "addnode=63.209.33.175" >> $CONF_DIR/$CONF_FILE
echo "addnode=45.77.223.47" >> $CONF_DIR/$CONF_FILE
echo "addnode=217.69.0.111" >> $CONF_DIR/$CONF_FILE
echo "addnode=68.114.79.172" >> $CONF_DIR/$CONF_FILE
echo "addnode=108.61.198.246" >> $CONF_DIR/$CONF_FILE
echo "addnode=165.227.171.94" >> $CONF_DIR/$CONF_FILE
echo "addnode=178.62.103.151" >> $CONF_DIR/$CONF_FILE
echo "addnode=167.99.217.240" >> $CONF_DIR/$CONF_FILE
echo "addnode=159.89.158.211" >> $CONF_DIR/$CONF_FILE
echo "addnode=45.76.46.69" >> $CONF_DIR/$CONF_FILE
echo "addnode=45.32.187.55" >> $CONF_DIR/$CONF_FILE
echo "addnode=45.76.46.69" >> $CONF_DIR/$CONF_FILE
echo "addnode=45.32.187.55" >> $CONF_DIR/$CONF_FILE
echo "port=$PORT" >> $CONF_DIR/$CONF_FILE
echo "bind=$IP" >> $CONF_DIR/$CONF_FILE
echo "externalip=$IP:$PORT" >> $CONF_DIR/$CONF_FILE
echo "masternodeaddr=$IP:$PORT" >> $CONF_DIR/$CONF_FILE
echo "masternodeprivkey=$PRIVKEY" >> $CONF_DIR/$CONF_FILE
sudo ufw allow $PORT/tcp
sudo apt-get install -y fail2ban

cd ips-3.1.0/bin/

./ipsd
