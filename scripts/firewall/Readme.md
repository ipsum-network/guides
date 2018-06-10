## Firewall rules for IPS masternode using ferm

### Abstract Ferm - For Easy Rule Making

From ferm's website (http://ferm.foo-projects.org/):
"ferm is a tool to maintain complex firewalls, without having the trouble to rewrite the complex rules over and over again."

#### I strongly encourage you to read the documentation...

However, if your vps is only used as an IPS masternode, installation of firewall should be as easy as following the steps below being logged on your vps as root:

* install ferm:

```apt update; apt install -y ferm```

When asked if you want ferm to be run at boot time, answer 'yes'

* then download the [ferm.conf](https://github.com/grnt4v/guides/blob/master/scripts/firewall/ferm.conf) file in /etc/ferm/ on your vps:

```wget -O /etc/ferm/ferm.conf https://github.com/grnt4v/guides/blob/master/scripts/firewall/ferm.conf```

* and then typing:

```ferm -i /etc/ferm/ferm.conf```

* Finally confirm by typing "yes".

That's it.
