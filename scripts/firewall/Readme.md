## Enhancing security of your masternode

From your VPS where your Masternode seats, run the following command as root:

```curl https://raw.githubusercontent.com/grnt4v/guides/master/scripts/firewall/firewall.sh | bash```

That's it.

This will install fail2ban and ferm with specific rules for IPS masternode.

If running other servers or nodes on the server, you need to adapt firewall rules in ferm.conf file.
