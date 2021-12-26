# How to remap keys in debian 

from <https://askubuntu.com/questions/325272/permanent-xmodmap-in-ubuntu-13-04/347382#347382?newreg=4eb097870a15490ebbe39d78412f9797>



Ubuntu no longer uses xmodmap, but instead uses xkb (as far as I understand, this facilitates per-window keyboard layouts, among other things).

The system-wide map files are in

/usr/share/X11/xkb/symbols/

The maps appears to be loaded hierarchically, with the pc map as the root, and whatever language (e.g. en) as a child of the root.

In my particular case, I physically swapped Page Up with Home and Page Down with End on my keyboard, so I very crudely made changes to the system-wide pc map, as follows:

 key <HOME> {    [  Prior        ]   };
 key <PGUP> {    [  Home         ]   };
 key  <END> {    [  Next         ]   };
 key <PGDN> {    [  End          ]   };

NOTE: To force Xorg to use your new keyboard map, you may have to remove the existing pre-compiled maps (*.xkm) in

/var/lib/xkb/

and then restart Xorg.

There are various resources on xkb, but this one is related to Ubuntu.

