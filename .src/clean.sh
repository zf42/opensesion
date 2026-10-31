#!/bin/bash

TARGET_NAME="Unlocked Computer"

SCHEMA="org.gnome.settings-daemon.plugins.media-keys"
KEY="custom-keybindings"

bindings=$(gsettings get "$SCHEMA" "$KEY")

for path in $(echo "$bindings" | grep -o "/org[^']*/"); do

    name=$(gsettings get \
        "$SCHEMA.custom-keybinding:$path" \
        name 2>/dev/null | tr -d "'")

    if [ "$name" = "$TARGET_NAME" ]; then

        updated=$(echo "$bindings" | sed "s|'$path', ||; s|, '$path'||; s|'$path'||")

        gsettings set "$SCHEMA" "$KEY" "$updated"

        echo "Atajo eliminado: $path"
        break
    fi
done
