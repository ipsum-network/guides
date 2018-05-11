# Windows Cold Wallet and Linux VPS Masternode Installation
*This section is designed to help you setup your Windows cold wallet and your Linux VPS masternode*

## Install the latest released IPSUM Windows Wallet
*Both 32bit and 64bit variants are available* 

[Wallet Releases](https://github.com/ipsum-ce/ips/releases)

## Open the IPSUM Windows Wallet

### Generate your masternode private key

  * Go to debug console (Tools - > Debug Console) and enter the following command
  ```masternode genkey```

### Get your IPSUM Windows Wallet Address

  * Still in the debug console, enter the following command
  ```getaccountaddress 0```
  * Record this address, you'll need it in the next step
  
### Send your IPS Masternode collateral transaction

  * Send exactly 5000 IPS to your wallet address you recorded in the step above.
  * This is critical to get right, it cannot be any other amount other than 5000 IPS. No more, no less

### Get your Masternode transaction output value
*Once you have recieved your masternode collateral transaction in your Windows wallet proceed with this step*

  * Still in the debug console, enter the following command
  ```masternode outputs```
  * Record this value, as you'll need it in the next step

### Get your Linux VPS external IP address

  * Record the external IP of your VPS instance, it will be used in the next step
  * Configure your VPS firewall to accept incoming connections on port 22331

### Create your Masternode configuration file

  * Open your masternode.conf file (Tools - > Open Masternode Configuration file) and create the
following line
  * Replace each < > field with the information obtained from the steps above.
    * ```<alias> <externalip>:22331 <masternode private key> <collateral txid> <collateral txid output>```
  * Example
    * ```mn1 167.99.234.180:22331 5dGdBDCYqMae1oRhH7djaBdyAfCGiJV9WgCFSVGmFwF6e5x3vpt 25dGdBDCYqasd123Mae1oRhH7asd123djaBdyAfCGiJV9WgCFSVGmFwF6e5x3vpt 0```
