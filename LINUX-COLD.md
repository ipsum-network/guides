# Linux Cold Wallet Masternode Installation

## Get your Linux VPS external IP address

  * Record the external IP of your VPS instance, it will be used in the next step
  * Configure your VPS firewall to accept incoming connections on port 22331

## Install the Linux VPS IPSUM Daemon

[Linux VPS IPSUM Daemon Installation Guide](LINUX.md)

## Install the Linux Cold IPSUM Daemon

[Linux VPS IPSUM Daemon Installation Guide](LINUX.md)

## Generate your masternode private key on the cold wallet

* From the terminal session, run the following commands
```
./ips-3.1.0/bin/ips-cli masternode genkey
```
* Record this key, you'll need it in later steps

## Get your IPSUM Linux Wallet Address on the cold wallet

  * From the terminal session, run the following commands
  ```
  ./ips-3.1.0/bin/ips-cli getaccountaddress 0
  ```
  * Record this address, you'll need it in the next step
  
## Send your IPS Masternode collateral transaction to the cold wallet

  * Send exactly 5000 IPS to your wallet address you recorded in the step above.
  * This is critical to get right, it cannot be any other amount other than 5000 IPS. No more, no less

## Get your Masternode transaction output value on the cold wallet
*Once you have recieved your masternode collateral transaction in your Windows wallet proceed with this step*

  * From the terminal session, run the following commands
  ```
  ./ips-3.1.0/bin/ips-cli masternode outputs
  ```
  * Record this value, as you'll need it in the next step

## Create your Masternode configuration file on the VPS

  * In the ~/.ips directory, edit the masternode.conf as described below
  * Replace each < > field with the information obtained from the steps above.
    * ```<alias> <externalip>:22331 <masternode private key> <collateral txid> <collateral txid output>```
  * Example
    * ```mn1 167.99.234.180:22331 5dGdBDCYqMae1oRhH7djaBdyAfCGiJV9WgCFSVGmFwF6e5x3vpt 25dGdBDCYqasd123Mae1oRhH7asd123djaBdyAfCGiJV9WgCFSVGmFwF6e5x3vpt 0```
    
## Edit your IPSUM Linux Daemon configuration file on the VPS

* From the terminal session, run the following commands
```
cd  ~/.ips
nano ~/.ips/ips.conf
```

* Uncomment the masternode entries, replace any < > field with your information
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
#masternode=1
port=22331
externalip=<externalip>:22331
#masternodeprivkey=<masternode private key>
```

* Save and Exit

## Stop the IPSUM Linux Daemon and restart it on the VPS

* From the terminal session, run the following commands
```
./ips-3.1.0/bin/ips-cli stop
./ips-3.1.0/bin/ipsd
```

### Start your Linux VPS masternode from Linux (For Linux Wallet Users)
*Ensure the wallet is in sync before proceeding*

[Starting your Linux VPS Masternode](LINUX-MN-START-LINUX.md)

