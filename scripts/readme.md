![](https://ipsum.network/images/logo-ipsum-coin-blue2x.png)

# IPS v3.1.0 Masternode Setup Guide [ Ubuntu 16.04 ]

THIS GUIDE IS FOR ROOT USERS -

YOU MUST BE A MEMBER OF THE FOLLOWING GROUP
```
User=root
Group=root
```

Shell script to install a [Ips Masternode](https://ipsum.network/) on a Linux server running Ubuntu 16.04. Use it on your own risk.
***

## Private Key

**This script can generate a private key for you, or you can generate your own private key on the Desktop software.**

Steps generate your own private key. 
1.  Download and install IPS 3.1.0 for Windows -   Download Link  - https://github.com/ipsum-network/ips/releases/
2.  When you start IPS, the wallet will **NOT"** sync. 
3.  We need to add the seeds (addnode=.....)
4.  Go to **Tools -> Click "Open Wallet Configuration File"**  
5.  Copy and paste the seeds from this link into the file you just opened (ips.conf) https://github.com/ipsum-network/seeds
6.  Save and close the file.
7.  Exit the IPS Wallet, then Open the IPS Wallet
8.  Go to **Tools -> Click "Debug Console"** 
9.  Type the following command: **masternode genkey**  
10. You now have your generated **Private Key**  (MasternodePrivKey)


## VPS installation
```
wget -q https://github.com/CryptoNeverSleeps/Ipsum-Core-Script/raw/master/ips_install.sh
bash ips_install.sh
```
Once the VPS installation is finished.

Check the block height

We want the blocks to match whats on the IPS block explorer (https://explorer.ipsum.network/)

Once they match you can proceed with the rest of the guide.

Check the block height with the following command
```
watch ips-cli getinfo
```
Make sure the version number matches.
```
"version" : 3010000,     ------------------This is the latest version (ips-v3.1.0)
```

Once the block height matches the block explorer issue the following command.
```
CTRL and C  at the same time  (CTRL KEY and C KEY)
```
***

## Desktop wallet setup  

After the MN is up and running, you need to configure the desktop wallet accordingly. Here are the steps:  
1. Open the Ips Desktop Wallet.  
2. Go to RECEIVE and create a New Address: **MN1**  
3. Send **5000** Ips to **MN1**. You need to send all 5000 coins in one single transaction.
4. Wait for 15 confirmations.  
5. Go to **Tools -> Click "Debug Console"** 
6. Type the following command: **masternode outputs**  
7. Go to  **Tools -> "Open Masternode Configuration File"**
8. Add the following entry:
```
Alias Address Privkey TxHash TxIndex
```
* Alias: **MN1**
* Address: **VPS_IP:PORT**
* Privkey: **Masternode Private Key**
* TxHash: **First value from Step 6**
* TxIndex:  **Second value from Step 6**
9. Save and close the file.
10. Go to **Masternode Tab**. If you tab is not shown, please enable it from: **Settings - Options - Wallet - Show Masternodes Tab**
11. Click **Update status** to see your node. If it is not shown, close the wallet and start it again. Make sure the wallet is un
12. Select your MN and click **Start Alias** to start it.
13. Alternatively, open **Debug Console** and type:
```
masternode start-alias MN1
``` 
14. Login to your VPS and check your masternode status by running the following command:.
```
ips-cli masternode status
```
***

## Usage:
```
ips-cli masternode status  
ips-cli getinfo
```
Also, if you want to check/start/stop **Ips**, run one of the following commands as **root**:

```
systemctl status Ips          #To check if Ipsum service is running  
systemctl start Ips           #To start Ipsum service  
systemctl stop Ips            #To stop Ipsum service  
systemctl is-enabled Ips      #To check if Ipsum service is enabled on boot  
```  
***

## Donations

Any donation is highly appreciated

**IPS**: ikPW7eMcLu17KzUASAZSVevLGSLX8FoxYc  
**BTC**: 32PN27dDZhUYAmyJTWuzDvNscbVpkL9855  
**ETH**: 0x02680cdF57EEDC20C8A12036CA03e8D5F813b33b  
**LTC**: MKYX9Pm58z6xSWT4Rc3CynjR58nj8hKo4F  
