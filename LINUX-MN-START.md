# Starting your Linux VPS Masternode

## Connect to your Linux VPS over SSH

  * Use your favorite terminal application on Linux or Putty/Bitvise clients on Windows
  * Connect to a terminal session with the Linux VPS
  
### Start your Linux VPS Masternode
*Note the alias you set when you created your masternode.conf*

  * From the terminal session, run the following commands
  ```
  ./ips-cli masternode start alias 0 <alias>
  ```

### Checking your Linux VPS Masternode Status

  * From the terminal session, run the following commands
  ```
  ./ips-cli masternode status
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


