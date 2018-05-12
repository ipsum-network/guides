# Linux Hot Wallet Masternode Installation

## Get your Linux VPS external IP address

  * Record the external IP of your VPS instance, it will be used in the next step
  * Configure your VPS firewall to accept incoming connections on port 22331

## Install the Linux VPS IPSUM Daemon

[Linux VPS IPSUM Daemon Installation Guide](LINUX.md)

## Generate your masternode private key

* From the terminal session, run the following commands
```
./ips-cli masternode genkey
```
* Record this key, you'll need it in later steps

## Get your IPSUM Windows Wallet Address

  * From the terminal session, run the following commands
  ```
  ./ips-cli getaccountaddress 0
  ```
  * Record this address, you'll need it in the next step
  
## Send your IPS Masternode collateral transaction

  * Send exactly 5000 IPS to your wallet address you recorded in the step above.
  * This is critical to get right, it cannot be any other amount other than 5000 IPS. No more, no less

## Get your Masternode transaction output value
*Once you have recieved your masternode collateral transaction in your Windows wallet proceed with this step*

  * From the terminal session, run the following commands
  ```./ips-cli masternode outputs```
  * Record this value, as you'll need it in the next step

### Create your Masternode configuration file

  * In the ~/.ips directory, edit the masternode.conf as described below
  * Replace each < > field with the information obtained from the steps above.
    * ```<alias> <externalip>:22331 <masternode private key> <collateral txid> <collateral txid output>```
  * Example
    * ```mn1 167.99.234.180:22331 5dGdBDCYqMae1oRhH7djaBdyAfCGiJV9WgCFSVGmFwF6e5x3vpt 25dGdBDCYqasd123Mae1oRhH7asd123djaBdyAfCGiJV9WgCFSVGmFwF6e5x3vpt 0```
