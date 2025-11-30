#!/bin/bash

SCHEMA="org.cinnamon.desktop.keybindings.media-keys"
KEY="volume-up"

CURRENT=$(gsettings get $SCHEMA $KEY)

if [[ "$CURRENT" == "['F9']" ]]; then
    gsettings set $SCHEMA $KEY "['']"
    echo "Volume hotkey unbound from F9."
else
    gsettings set $SCHEMA $KEY "['F9']"
    echo "F9 bound to volume control again."
fi

# i have this file attached to linux mint's keyboard shortcut setting to ctrl + f9 as a custom script.
# what is does? when i press ctrl + f9, it will disable f9 key, to work as normally when you install your linux, 
# why you did this? good question, cuz i have f9 key for increase volume function in linux mint's keyboard shortcut setting
# ppl: wow its amazing: yes it is ! makes life hell a lot easier
