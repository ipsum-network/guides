# Docker Masternode Installation
*Docker runs on Windows, Linux, and OSX so this same guide can used on any of these platforms*

## Get your Linux VPS external IP address

  * Record the external IP of your VPS instance, it will be used in the next step
  * Configure your VPS firewall to accept incoming connections on port 22331

## Install the Docker on Ubuntu

[Docker Installation Guide](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

## Create a space to store the blockchain and configuration

  * From the terminal session, run the following command
  ```
  mkdir -p /home/user/blockchains/ips
  ```
## Create your IPSUM Linux Daemon configuration file

* From the terminal session, run the following commands
```
nano /home/user/blockchains/ips/ips.conf
```

* Now add the following lines to this file, replacing any < > field with your information
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

* Get the latest node seeds from [here](https://github.com/ipsum-network/seeds/blob/master/README.md)
* Copy and paste the addnode lines into the bottom of this file
* Save and Exit

## Run the IPSUM Linux Daemon in Docker

* From the terminal session, run the following commands
```
docker run -dit --name ipsd -p 22331:22331 --restart=always -v /home/user/blockchains/ips:/root/.ips ipsumnetwork/ipsd
```

## Wait for the IPSUM Linux Daemon to sync

* From the terminal session, run the following commands
```
docker exec -it ipsd /ips/src/ips-cli getinfo
```
* Compare the "Block Height" value with the latest from the [IPSUM block explorer](https://explorer.ipsum.network/). When those are the same, your daemon is synchronized 

## Generate your masternode private key

* From the terminal session, run the following commands
```
docker exec -it ipsd /ips/src/ips-cli masternode genkey
```
* Record this key, you'll need it in later steps

## Get your IPSUM Linux Wallet Address

  * From the terminal session, run the following commands
  ```
  docker exec -it ipsd /ips/src/ips-cli getaccountaddress 0
  ```
  * Record this address, you'll need it in the next step
  
## Send your IPS Masternode collateral transaction

  * Send exactly 5000 IPS to your wallet address you recorded in the step above.
  * This is critical to get right, it cannot be any other amount other than 5000 IPS. No more, no less

## Get your Masternode transaction output value
*Once you have recieved your masternode collateral transaction in your Windows wallet proceed with this step*

  * From the terminal session, run the following commands
  ```
  docker exec -it ipsd /ips/src/ips-cli masternode outputs
  ```
  * Record this value, as you'll need it in the next step

## Create your Masternode configuration file

  * In the /home/user/blockchains/ips directory, edit the masternode.conf as described below
  * Replace each < > field with the information obtained from the steps above.
    * ```<alias> <externalip>:22331 <masternode private key> <collateral txid> <collateral txid output>```
  * Example
    * ```mn1 167.99.234.180:22331 5dGdBDCYqMae1oRhH7djaBdyAfCGiJV9WgCFSVGmFwF6e5x3vpt 25dGdBDCYqasd123Mae1oRhH7asd123djaBdyAfCGiJV9WgCFSVGmFwF6e5x3vpt 0```
    
## Stop the IPSUM Linux Daemon and restart it

* From the terminal session, run the following commands
```
docker exec -it ipsd /ips/src/ips-cli stop
docker restart ipsd
```

### Start your Linux VPS masternode from Docker
*Ensure the wallet is in sync before proceeding*
*Note the alias you set when you created your masternode.conf*

  * From the terminal session, run the following commands
  ```
  docker exec -it ipsd /ips/src/ips-cli startmasternode alias 0 <alias>
  ```

### Checking your Linux VPS Masternode Status

  * From the terminal session, run the following commands
  ```
  docker exec -it ipsd /ips/src/ips-cli masternode status
  ```
  * Your output should be similar to the following
```
  {
    "txhash" : "<txid>",
    "outputidx" : <txid output>,
    "netaddr" : "<externalip>:22331",
    "addr" : "<wallet address>",
    "status" : 4,
    "message" : "Masternode successfully started"
  }
```

### Profit
*Newly started masternodes take about 24 to 28 hours before they start recieving block rewards, so please be patient.*

### Useful Commands

#### Watch the daemon logs

  * From the terminal session, run the following commands
  ```
  docker logs -f ipsd
  ```


