# CossenOS

Watch [this video](https://TODO) to see a full installation example that may help you follow the steps below.

## Installation

Download an Arch Linux ISO [here](https://archlinux.org/download/) and boot into it on your machine.

Now install Arch, either following the wiki or running the recommended `archinstall` script. You can see what it does [here](https://github.com/archlinux/archinstall).
```bash
archinstall
```

While installing, select [qtile](https://github.com/qtile/qtile) as your window manager.

After a successful installation, reboot your computer and boot into the disk where you installed Arch.

Now press `Super+Enter` to start a new terminal session. There you should run the post-install CossenOS script:

```bash
sudo sh <(curl https://TODO)
```

You can stop it and run it again if you have any issue during the process.

If you have DNS problems, add `nameserver 8.8.8.8` to your `/etc/resolv.conf` file.

---

## Using qtile

Refer to the [documentation](http://docs.qtile.org/en/stable/).
Qtile is small and customizable, change its config file according to your taste!

By default we use Vim bindings for navigation. Use `Super+Enter` to open a terminal window, `Super+w` to close the active window and `Super+[number]` to go to another workspace.

