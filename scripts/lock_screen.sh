#!/bin/sh

TOP_DIRECTORY="$HOME/.wallpapers/overswag"
UPPER_LAYERS=( $(ls "$TOP_DIRECTORY") )
NB_LAYERS=${#UPPER_LAYERS[@]}
RAND=$(echo "$RANDOM % $NB_LAYERS" | bc)

LAYER="$TOP_DIRECTORY/${UPPER_LAYERS[$RAND]}"

echo $LAYER

scrot /tmp/lock.png
blur_image /tmp/lock.png -o /tmp/blurred.png
convert /tmp/blurred.png "$LAYER" -composite /tmp/final.png
/usr/bin/i3lock --pointer=win -i /tmp/final.png -b
rm /tmp/lock.png /tmp/blurred.png /tmp/final.png
