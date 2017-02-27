#!/bin/sh

function uniform_random {
  touch /tmp/uniform_random

  NB_LAYERS=$1
  FILES=( $(cat /tmp/uniform_random) )
  EMPTY=0

  if [ ${#FILES[@]} -eq $NB_LAYERS ];
  then
    rm /tmp/uniform_random
    touch /tmp/uniform_random
    EMPTY=1
  fi

  PRESENT=0
  RAND=$(( $RANDOM % $NB_LAYERS ))

  if [ $EMPTY -eq 1 ];
  then
    echo $RAND >> /tmp/uniform_random
    echo $RAND
    return
  fi

  while true
  do
    for i in ${FILES[@]}
    do
      if [ "$RAND" -eq "$i" ];
      then
        PRESENT=1
        break
      fi
    done

    if [ "$PRESENT" -eq "1" ];
    then
      RAND=$(( $RANDOM % $NB_LAYERS ))
      PRESENT=0
      continue
    else
      echo $RAND >> /tmp/uniform_random
      echo $RAND
      return
    fi
  done
}


TOP_DIRECTORY="$HOME/.wallpapers/overswag"
UPPER_LAYERS=( $(ls "$TOP_DIRECTORY") )

RAND=$( uniform_random ${#UPPER_LAYERS[@]} )

LAYER="$TOP_DIRECTORY/${UPPER_LAYERS[$RAND]}"

scrot /tmp/lock.png
convert -blur 12x12 /tmp/lock.png /tmp/blurred.png
convert /tmp/blurred.png "$LAYER" -composite /tmp/final.png
/usr/bin/i3lock --pointer=win -i /tmp/final.png -b
rm /tmp/lock.png /tmp/blurred.png /tmp/final.png
