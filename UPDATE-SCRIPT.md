# CryptoNeverSleeps IPSUM Update Script
*If you used CryptoNeverSleeps installation script, this update will work for you*

## Linux VPS

### Connect to your Linux VPS over SSH

  * Use your favorite terminal application on Linux or Putty/Bitvise clients on Windows
  * Connect to a terminal session with the Linux VPS

### Download and set the permissions on the script

  * From the terminal session, run the following commands
  ```
  wget https://raw.githubusercontent.com/ipsum-network/guides/master/scripts/ipsum_update.sh
  ```
  ```
  chmod 755 ipsum_update.sh
  ```

### Run the update

  * From the terminal session, run the following commands
  ```
  ./ipsum_update.sh
  ```
### Check the IPSUM Linux Daemon 
*Now check that the daemon is in sync and display the proper version*

  * From the terminal session, run the following commands
  ```
  cd ips-3.1.0/bin
  ```
  ```
  ./ips-cli getinfo
  ```

  * Compare the "Block Height" value with the latest from the [IPSUM block explorer](https://explorer.ipsum.network/). When those are the same, your daemon is synchronized

  * Compare the version string displayed, if upgraded properly it will say ```"version" : 3010000```

### Check the IPSUM Masternode Status
*Now check that the daemon is in sync and display the proper version*

  * From the terminal session, run the following commands
  ```
  cd ips-3.1.0/bin
  ```
  ```
  ./ips-cli masternode status
  ```

  * If you get Status 4 - Masternode successfully started - All finished

  * If it is Status 2 - Start the masternode.
