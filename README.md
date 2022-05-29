# Enables local dns in /etc/resolv.conf if needed

#### This is required for [devilbox](https://github.com/cytopia/devilbox) Auto DNS feature to work properly. For more info see [devilbox documentation](https://devilbox.readthedocs.io/en/latest/intermediate/setup-auto-dns.html).
___

### Requirements:
```
bash
sed
root privileges for /etc/resolv.conf modification & backup
```

### Installation:
```shell
$ sudo ln -sf $PWD/switch.sh /usr/bin/ldnsswitch    # or whatever name you want.
```

### Usage:
```shell
$ sudo ldnsswitch
```

### Note:
This script makes a lot of backup files which can clutter your `/etc` directory. To remove all backups, run:
```shell
sudo rm -f /etc/resolf.conf.ld*
```
This requires your shell to have [globbing](https://en.wikipedia.org/wiki/Glob_(programming)) enabled.