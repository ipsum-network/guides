# IPSUM Windows Wallet - Linux VPS Masternode Instructions

## Requirements:
* A local Masternode Wallet with the required Masternode collateral (5000 IPS).
* A Linux VPS with a Static IP Address.

* For this guide we are using a Local Windows Wallet with Ubuntu 16.04 running on the VPS. 
* A 25GB SSD and 1000GB bandwidth will suffice (I suggest www.vultr.com). 
* Select IPV6 and Private Networking. I will leave DDoS and Automatic backups to you. 
* Leave SSH Keys and Startup Script blank.


## Setup Windows Wallet:

* Download the latest Windows wallet from here [Releases](https://github.com/ipsum-network/ips/releases)
* Run the installer, and leave everything as default.
* Run the qt, then close it again.

### Syncing

* Open the ips.conf file. It can be found in C:/Users/<Your User>/AppData/Roaming/IPS.
* Copy the addnodes from [here](https://github.com/ipsum-network/seeds/blob/master/README.md) into this file, then save it.
* Re-open your IPS qt. It will now sync much more quickly.

### Addresses

* Whilst it is syncing, create two addresses in the receiving tab. For one, I always use the name of exchange I have purchased the coin from. In this instance it will be called “Graviex”. The other will be called MN1 (For your masternode).

### Wallet Adjustments

* Through options, enable Coin Control, as well as the Masternodes tab (under “Wallet”). As this will require a wallet restart, you may as well go through and change things as you see fit. i.e. Decimals Digits, Interface Theme, and Map Port using UPnP.
* Once this is complete, encrypt your wallet. Once encryption is complete, your wallet will close. Reopen it.

### Exchange

* Open your exchange, and transfer at least 5001 coins to the “Graviex” address. Be sure to account for exchange fees.
* You should receive your coins almost instantly. Please wait for them to confirm before proceeding.

### Coin Control

* Coin Control is how we will create a transaction of *exactly* 5000 IPS. This is necessary, as any other amount is ineligible for a MN status.
* Copy your MN1 address to the clipboard.
* Open the send tab.
* Choose “Inputs” at the top left of the window.
* It should have “List Mode” checked. If not, check it.
* You will see your transaction under the label Graviex. Check it on the left hand panel and click OK.
* Paste your MN1 address in the “Pay To” section. The label “MN1” should automatically be displayed.
* Input 5000 into the “Amount” section.
* Press send, and pay any transaction fees.
* After 2 minutes, open Coin Control again. You should see a transaction of exactly 5000 IPS under MN1. Wait for it to receive 15 confirmations before the next step.

### Masternode Info

* Open a blank notepad document.
* Unlock your wallet.
* Open the Debug Console (under Tools).
* Input the command: masternode genkey. This will give you your private key. Do not share this with anyone.
* Copy this to the notepad file.
* Input the command: masternode outputs (This will give display your Transaction Hash and Index. It will be a long string of nonsense, and a number (either 1 or 0).
* Copy these to the notepad file.

### That is all you need to do with your Windows Wallet for now.


## SETUP MASTERNODE DAEMON:

* Install Putty on your Windows machine
https://www.putty.org/
* Log in to your Ubuntu VPS
Using the login credentials provided by your VPS provider, login using Putty 
* Type the IP address of your VPS below ‘Host Name (or IP address)’
* Select ‘SSH’ as Connection type.
* Click ‘Open’, and a New Terminal should open.
* It will request your login and password, enter the supplied credentials from your VPS provider. (Keep in mind, your password will not display at log in. Shift+Ins will allow you to paste into putty from Windows).
* Use the instructions below. Be sure to follow them exactly, for those with limited Linux experience may not be able to roll back changes (talking from experience).

```sudo apt-get -y update```

```sudo apt-get -y upgrade```

```sudo apt-get -y dist-upgrade```

* Let’s make sure that we have a 3G swapfile. The following instruction set from Vultr has helped many times.
(https://www.vultr.com/docs/setup-swap-file-on-linux)
* Once that has been completed, it is now time to download the latest version of the wallet onto your VPS. For now, that is 3.1.0.0 Paste from the instructions below.

```wget https://github.com/ipsum-network/ips/releases/download/v3.1.0.0/ips-3.1.0-linux.tar.gz```

* Then we will unpack this file: (This is a very important step).

```tar -xvf ips-3.1.0-linux.tar.gz```

* Once that is complete, run the following commands in sequence. Note, some will take a long time, so it is important not to interfere.

```sudo apt autoremove –y```

```sudo apt-get update```

```sudo apt-get install libzmq3-dev libminiupnpc-dev libssl-dev libevent-dev -y```

```sudo apt-get -y install git automake build-essential libtool autotools-dev autoconf pkg-config libssl-dev libboost-all-dev software-properties-common```

```sudo add-apt-repository ppa:bitcoin/bitcoin``` (hit enter at prompt)

```sudo apt-get update```

```sudo apt-get install libdb4.8-dev libdb4.8++-dev```

```sudo apt-get install htop mc```

```mkdir -p ~/.ips```

```nano ~/.ips/ips.conf```

* Copy/paste:

```
rpcuser=<rpcusername>
rpcpassword=<rpcpassword>
rpcport=22332
listen=1
server=1
daemon=1
staking=0
rpcallowip=127.0.0.1
logtimestamps=1
masternode=1
port=22331
externalip=<externalip>:22331
masternodeprivkey=<masternode private key>
<INSERT NODES HERE>
```

* For <rpcusername> and <rpc password>, use any text you would like. You will not need to remember it, but once you start the daemon, do not change it.
* masternodeprivkey=<your masternode genkey result from the notepad file>
* As you might imagine, you insert the seed nodes where <INSERT NODES HERE> is. Find the list [here](https://github.com/ipsum-network/seeds/blob/master/README.md). It is the same as what you have used in your Windows wallet.

```reboot```

* Reopen Putty, and use the same log in credentials as before. When the command window appears, you will notice the user name has changed to reflect what you called the server at deployment

```./ips-3.1.0/bin/ipsd```

## MASTERNODE START

### Back in your Windows Wallet

* Under Tools in your Windows Wallet, select “Open Masternode Configuration File”.
* Input your Masternode info. It should look like this:

* ```<MN ALIAS><VPS_IP:22331><MN GENKEY><TXHash><TXIndex>```

* For example

* ```IPSUM_MN1 167.99.234.180:22331 5dGdBDCYqMae1oRhH7djaBdyAfCGiJV9WgCFSVGmFwF6e5x3vpt 25dGdBDCYqasd123Mae1oRhH7asd123djaBdyAfCGiJV9WgCFSVGmFwF6e5x3vpt 0```

* Save and close this file.
* (NOTE) If you plan on running multiple MNs from the one Windows wallet, you simply have to enter a new line with the unique information for that MN.
* Restart your wallet.
* Once it has re-synced completely, go to the Masternodes tab.
* Your MN should appear here with the status of “MISSING” and a last seen of sometime in 1970.
* Click “Start Missing” at the bottom of the window. It will ask you to unlock your wallet. Do so.
* Your MN will start.
* Close your Putty window.
* Wait for the payments to roll in. This will take ~18-24 hours for your first one, and roughly every 6 hours after that.

## Post accomplishment in Discord	

*After you have setup everything please take a screen capture of your node running in your wallet or type the IP and post it in #mn-hodler.

[Discord Channel](https://discordapp.com/channels/443435262916427776/443633482468425729)

Example:
144.202.51.69:22331

## Congratulations, you are now the operator of your very own IPS Masternode! This will support the integrity of the IPS network, as well as secure a passive income well into the future.
