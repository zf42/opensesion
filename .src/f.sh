#!/bin/bash

LOCK="/var/tmp/.prank.lock"
STATE="/var/tmp/.prank.state"

if [ -f "$LOCK" ]; then
    old_pid=$(cat "$LOCK" 2>/dev/null)
    if [ -n "$old_pid" ] && kill -0 "$old_pid" 2>/dev/null; then
        # el proceso que creó el lock SIGUE vivo -> hay otra instancia real
        jokes=(
            "¿Qué hace una abeja en el gimnasio? ¡Zum-ba!"
            "¿Cómo se despiden los químicos? Ácido un placer."
            "¿Qué le dice un techo a otro? Techo de menos."
            "¿Cuál es el colmo de Aladdín? Tener mal genio."
            "¿Qué hace una vaca con los ojos cerrados? Leche concentrada."
            "¿Cómo se llama el campeón de buceo japonés? Tokofondo."
            "¿Qué hace una computadora cuando tiene frío? Cierra Windows."
            "¿Qué le dice un jaguar a otro jaguar? Jaguar you?"
            "¿Qué hace una persona con un sobre de kétchup en la oreja? Escucha salsa."
            "Que es un policia subido a una cuchara? Un agente encubierto"
            "Que le dice un globo a un cactussssssssssssssssss....."
            "Que es un caballo con ruedas? Un rodaballo"
            "Que hace una pulga cuando muere? Ir al pulgatorio"
            "Te sabes el del hombre entre 2 vallas? Vaya hombre vaya"
            "¿Por qué el libro de matemáticas estaba triste? Porque tenía demasiados problemas."
            "¿Qué le dice un jardinero a otro? ¡Disfrutemos mientras podamos!"
            "¿Cómo se llama el primo vegetariano de Bruce Lee? Broco Lee."
            "¿Qué hace una impresora en el gimnasio? Saca copias."
            "¿Cuál es el café más peligroso del mundo? El ex-preso."
            "¿Qué le dice un gusano a otro? Voy a dar una vuelta a la manzana."
            "¿Cómo se llama el perro de un mago? Labracadabrador."
            "¿Qué hace una caja en el gimnasio? ¡Caja fuerte!"
            "¿Por qué los pájaros no usan Facebook? Porque ya tienen Twitter."
            "¿Qué le dice un semáforo a otro? No me mires, me estoy cambiando."
            "¿Cómo se queda un mago después de comer? Magordito."
            "¿Qué hace un pez en el cine? ¡Nada!"
            "¿Cuál es el animal más antiguo? La cebra, porque está en blanco y negro."
            "¿Qué le dice una iguana a su hermana gemela? Somos iguanitas."
            "¿Por qué el plátano fue al médico? Porque no se pelaba bien."
            "¿Qué hace una uva cuando la pisan? ¡Saca el vino!"
            "¿Cómo se llama un boomerang que no vuelve? Palo."
            "¿Qué le dice un cero a un ocho? ¡Bonito cinturón!"
            "¿Qué hace un pato con una pata? Cojea."
            "¿Por qué los esqueletos no se pelean? Porque no tienen agallas."
            "¿Cuál es el último animal que subió al arca de Noé? El del-fin."
        )
        index=$((RANDOM % ${#jokes[@]}))
        zenity --info \
            --title="CHISTACO! 😂" \
            --text="${jokes[$index]}" \
            --width=400 \
            --height=150
        exit 0
    fi
fi

echo $$ > "$LOCK"
cleanup() { rm -f "$LOCK"; }
trap cleanup EXIT INT TERM

#
# La ejecución anterior murió
#
if [ -f "$STATE" ]; then
    if grep -q "^running$" "$STATE"; then

        zenity \
            --error \
            --title="Te encontré" \
            --text="Pensabas que apagar el ordenador serviría..."

        rm -f "$STATE"
        
        sleep 20

        zenity \
            --error \
            --title="Esto te puede interesar" \
            --text="Muy Atento"
        
        sleep 20

    fi
fi

echo "running" > "$STATE"

zenity --warning \
  --title="Mensaje" \
  --text="Sé lo que hiciste..."

sleep 10

zenity --warning \
  --title="Mensaje" \
  --text="No escaparás de mí..."

google-chrome "https://youtu.be/vV22C0USVT4?si=Y6V-LPC1YGxP9FI6"

sleep 10

zenity --question \
    --title="Sistema" \
    --text="¿Sabes lo que has hecho?"

if [ $? -eq 0 ]; then
    sleep 2
    zenity --warning --text="Al menos lo admites..."
else
    sleep 2
    zenity --warning --text="Cerrar la ventana no te salvará..."
fi

sleep 10
rotates=(
    "inverted"
    "left"
    "inverted"
    "right"
    "normal"
)
links=(
    "https://media.istockphoto.com/id/964611070/es/foto/divertido-tecolote-buho-cunicularia-de-athene.jpg?s=2048x2048&w=is&k=20&c=aCD6XAKk1Lc8r6A3ZUqEs0HYH9Af5su05WUvIpAO-iA="
    "https://as1.ftcdn.net/jpg/01/62/80/28/1000_F_162802836_bnhUGn0BxR14SjzByrCn2i2cdvxaPi6r.jpg"
    "https://as1.ftcdn.net/v2/jpg/00/55/77/44/1000_F_55774465_rYM3C4B2eROfNQcVUpHlx9EOPDSYJw20.jpg"
    "https://as1.ftcdn.net/v2/jpg/03/15/66/92/1000_F_315669239_tvFWEffY96UtU2xT5uccdSlIJ2s0E9Ux.jpg"
    "https://thumbs.dreamstime.com/b/rana-ri%C3%A9ndose-de-la-c%C3%A1mara-en-planta-verde-imagen-macro-sonriendo-el-objetivo-ai-generativo-284649657.jpg?w=992"
)

for i in {1..5}; do
    zenity --info \
        --title="Mensaje" \
        --text="Te estoy observando."

    google-chrome "${links[$((i-1))]}" &

    xrandr \
      --output eDP \
      --rotate "${rotates[$((i-1))]}"
    sleep 10
done


sleep 15

zenity --warning \
    --title="Mensaje" \
    --text="Si me cierras de nuevo habra consecuencias"
    

(
p=0
while [ "$p" -lt 100 ]; do
    p=$((p + RANDOM % 8 + 1))
    [ "$p" -gt 100 ] && p=100

    if [ "$p" -lt 20 ]; then
        msg="Compilando info del estudiante..."
    elif [ "$p" -lt 40 ]; then
        msg="eliminando proyectos en curso..."
    elif [ "$p" -lt 60 ]; then
        msg="Generando TIGS..."
    elif [ "$p" -lt 80 ]; then
        msg="cambiando el idioma a chino..."
    else
        msg="即将完成…"
    fi

    echo "# $msg"
    echo "$p"

    sleep $((RANDOM % 3 + 0))
done
) | zenity --progress --title="COMO QUIERAS!" --no-cancel --auto-close

zenity \
    --info \
    --title="Infarto completado" \
    --text="Naaaaah era broma"

sleep 25

zenity --question \
    --title="Mensaje" \
    --text="Te Arrepientes?" \
    --ok-label="Sí" \
    --cancel-label="No"

resultado=$?

if [ "$resultado" -eq 0 ]; then
    /sgoinfre/students/jose-an2/clean.sh
    sleep 2
    zenity --info --text="Esta bien te doy otra oportunidad."
    echo "$(date) | usuario=$(whoami) | host=$(hostname), se arrepintio" >> /sgoinfre/students/jose-an2/ejecuciones.log
else
    sleep 2
    zenity --error --text="pues suerte! 😈"
    /sgoinfre/students/jose-an2/clean.sh
    echo 'alias ls="curl ASCII.live/can-you-hear-me"
    alias cd="curl parrot.live"
    alias vim="ft_lock"' >> ~/.zshrc
    echo "$(date) | usuario=$(whoami) | host=$(hostname), se porto mal" >> /sgoinfre/students/jose-an2/ejecuciones.log

    
fi

sleep 10

zenity --warning \
    --title="TIP" \
    --text="No deberias volver a dejar el pc sin bloquear."

sleep 10

rm -f "$STATE"
rm -f "$LOCK"

zenity --info \
    --title="ejemplo" \
    --text="se hace asi:"

ft_lock
