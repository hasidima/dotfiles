# How to boot into tty after reboot

## Permanently

[This is a lint to the article](https://www.linuxuprising.com/2020/01/how-to-boot-to-console-text-mode-in.html)

## Permanently booting to text mode (console mode)
sudo systemctl set-default multi-user.target

## Don't know the current systemd target used on your system? Use this command, which will show the currently set target:
systemctl get-default

## In case you want to undo this change and get your Linux system to boot to the default graphical mode, use:
sudo systemctl set-default graphical.target

## How to log out from GUI into TTY
gnome-session-quit

## Start GUI manually from a command line
sudo systemctl start gdm3


