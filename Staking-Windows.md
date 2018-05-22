## Windows Wallet Staking Guide
* This section is designed to help you setup your Windows wallet for staking IPS

Install the latest released IPSUM Windows Wallet
Both 32bit and 64bit variants are available

[Wallet Releases](https://github.com/ipsum-network/ips/releases)

## Basic wallet Staking
From inside your wallet create a passphrase
```
Settings -> Encrypt Wallet
```

* Enable Staking in Configuration file
	From inside your wallet open the configuration file
```
Tool -> Open Wallet Configuration File
```

Inside configuration file add and reload wallet.
```
Staking=1
```

* Start Staking

	From wallet unlock your wallet for staking
```
Settings -> Unlock Wallet
```

Now you are set to start staking your IPS

Note: Remember transaction in your wallet will need 101 conformations to be eligable to start staking.




## Indexing coins for Staking.

In this tutorial we will be indexing 2000 IPS into a index of 1000 IPS each

* From wallet turn on coin control

```
Settings -> Options -> Wallet -> Enable coin control features
```

* Generate address for indexing

	From wallet generate a new address for indexing

```
Tools -> Debug console -> (Type) getaccountaddress 0
```

* Making the Index

	From wallet navigate to send coin section.

		Make sure Split UTXO is checked, enter 2 for the number of splits in the box to the right of the check box.

		Now enter the address you just generated in the Pay To: (Address you generated from previous step)

	Next enter the amount of coins to split (2000)

Then send transaction

* Viewing Indexed coins
	From wallet navigate back to the send coins section.
		Click on inputs to view a breakdown of indexed addresses.

*Labeling Address
	From wallet navigate to receiving addresses

```
File -> Receiving Addresses
```

You will need to compare which address is which if you didnt assign a label at the time of sending coins with the address that are indexed in the method above on seeing a break down of indexed address.

	When you know which address is which you can right click on the address and click rename.

	I personally rename in the split method i assigned when i made the index (Stake 2 (1000)

	This will allow you to identify which index is gaining a staking reward and how often in the inputs section.
