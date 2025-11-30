#!/bin/bash

SCHEMA="org.cinnamon.desktop.keybindings.media-keys"
KEY="volume-mute"

CURRENT=$(gsettings get $SCHEMA $KEY)

if [[ "$CURRENT" == "['F7']" ]]; then
    gsettings set $SCHEMA $KEY "['']"
    echo "Mute hotkey unbound from F7."
else
    gsettings set $SCHEMA $KEY "['F7']"
    echo "F7 bound to mute control again."
fi

# i have this file attached to linux mint's keyboard shortcut setting to ctrl + f7 as a custom script.
# what is does? when i press ctrl + f7, it will disable f7 key, to work as normally when you install your linux, 
# why you did this? good question, cuz i have f7 key for mute function in linux mint's keyboard shortcut setting
# ppl: wow its amazing: yes it is ! makes life hell a lot easier
