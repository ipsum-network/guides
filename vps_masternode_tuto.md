Connect to your vps using ssh or putty:

```ssh root@<your vps IP>```

Input the following commands in your VPS terminal:

Let's add a user for ips

```adduser ips```

Each time we want to work with ips, we need to change to user ips like this:

```sudo -u ips -i```

Now that we are ips, let's retrieve the ips files:

```wget https://github.com/ipsum-network/ips/releases/download/v3.1.0.0/ips-3.1.0-linux.tar.gz```

uncompress them:

```tar xzf ips-3.1.0-linux.tar.gz```

Create a directory for the configuration:

```mkdir -p ~/.ips```

and edit the config file:

```nano ~/.ips/ips.conf```

Copy this in the file (choose whatever you like for <rpcusername> and <rpcpassword> and never touch them later; you should have created a masternode private key with your wallet (ips-qt) using the debug console: masternode genkey or ./ips-cli masternode genkey if you're using the cli):

```rpcuser=<rpcusername>
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
externalip=<your vps IP>:22331
masternodeprivkey=<masternode private key>
```

\<Ctrl> + o \<Ctrl> + x

This should close your ips.conf

Let's add the nodes:

```wget https://github.com/ipsum-network/seeds/blob/master/README.md
sed -ni 's/.*\(addnode=\)/\1/p' README.md
cat README.md >> .ips/ips.conf
```
and start the server so that it starts to sync:

```./ips-3.1.0/bin/ipsd```

and clean this place:

```rm ips-3.1.0-linux.tar.gz README.md```

Let's check the server is syncing:

```./ips-3.1.0/bin/ips-cli getinfo```
