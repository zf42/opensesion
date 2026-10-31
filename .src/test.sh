#!/bin/bash

# Ruta absoluta a la imagen (cámbiala por la tuya)
WALLPAPER="/sgoinfre/students/jose-an2/screen.png"

# Cambiar fondo (modo claro)
gsettings set org.gnome.desktop.background picture-uri "file://$WALLPAPER"

# Cambiar fondo (modo oscuro, por si usas tema oscuro)
gsettings set org.gnome.desktop.background picture-uri-dark "file://$WALLPAPER"
