# Preparation of your wallet

Open your wallet, in __Options__ (via setup menu), choose __wallet__ tab and check "enable coin control features". Then click OK and restart wallet.

Choose __Send__, click input and unlock your wallet using "toggle lock state".

Create a new address, let's call it MN1 by now choosing __Receive__ then input MN1 in Label, and click "request payment".
Still from your wallet, send exactly 5000IPS to your MN1 address.
Wait until 15 confirmations have been received. It can take ~5 minutes. (If in a hurry, you may start the VPS setup see below til "edit the config file")

From the tools menu, open the __Debug Console__ and __open the masternode configuration file__
In your masternode configuration file, input a new line:

```MN1 <your vps IP>:22331 ```

In the debug console, input the command:

```masternode genkey```

This gives you your <masternode priv key>. Copy it in your masternode configuration file after 22331 (keep a space between 22331 and the masternode priv key) and keep your masternode priv key secret.

Be sure the 5000IPS payment to MN1 have reached at least 15 confirmations before inputing the following command:

```masternode outputs```

This gives you a <transaction hash> (long string of nonsense) and an <index> (0 or 1)
Add this to your masternode configuration file which should now look like this:
  
```MN1 <your vps IP>:22331 <masternode priv key> <transaction hash> <index>```

  which might be something similar to the following line:
  
```MN1 111.222.111.222:22331 df1265465465432KSJBFNSKJ aLJKHVBSFDLJHGbcdeSFKJSFf654321abcdef321654abcdef321654 1```

Save and close your masternode configuration file.
Close the debug console.

# Configure your VPS to make it a masternode

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

# Let's finish

Go back to your wallet and restart it.

Once it's resynced, go the __masternodes tab__.

You should see your MN1 with a status "MISSING".

Click "Start Missing" at the bottom of the windows.

The status will now show "ENABLED".

Now wait until the masternode is fully synced and the active time will start to raise.

Congrats! You're almost done.

Now wait for ~30h to see the first payment and then every ~14 hours.

# Conclusion

Take a screenshot of the __masternodes__ tab of your wallet and post it in #mn-hodler in the discord channel with <your vps IP> as a comment to be upgraded as a mn-hodler.
