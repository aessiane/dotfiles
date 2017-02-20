#!/bin/sh

xbacklight $1
brightnessLevel=$(cat /sys/class/backlight/intel_backlight/actual_brightness)
maxBrightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)

brightnessLevel=$(echo "$brightnessLevel * 15 / $maxBrightness" | bc)

echo $brightnessLevel
echo $maxBrightness
color1="#F7E599'>"
color2="#F7E081'>"
color2="#F7DB68'>"
color3="#F7DB68'>"
color4="#F5CF38'>"
color5="#F5CC27'>"
color6="#F7CA16'>"
color7="#FACB0F'>"
color8="#F7C600'>"
col="<span color='"
end="</span>"

NID=""

if [ -f /tmp/brightness ]
then
  NID="-r $(cat /tmp/brightness)"
fi

# Red swag: #900C3F

SIGN="\uf057"

case $brightnessLevel in
  0)      notify-send -p $NID "Brightness:" "$col$color1o$endooooooooooooooo" > /tmp/brightness;;
  1)      notify-send -p $NID "Brightness:" "$col$color1oo$endoooooooooooooo" > /tmp/brightness;;
  2)      notify-send -p $NID "Brightness:" "$col$color2ooo$endooooooooooooo" > /tmp/brightness;;
  3)      notify-send -p $NID "Brightness:" "$col$color2oooo$endoooooooooooo" > /tmp/brightness;;
  4)      notify-send -p $NID "Brightness:" "$col$color3ooooo$endooooooooooo" > /tmp/brightness;;
  5)      notify-send -p $NID "Brightness:" "$col$color3oooooo$endoooooooooo" > /tmp/brightness;;
  6)      notify-send -p $NID "Brightness:" "$col$color4ooooooo$endooooooooo" > /tmp/brightness;;
  7)      notify-send -p $NID "Brightness:" "$col$color4oooooooo$endoooooooo" > /tmp/brightness;;
  8)      notify-send -p $NID "Brightness:" "$col$color5ooooooooo$endooooooo" > /tmp/brightness;;
  9)      notify-send -p $NID "Brightness:" "$col$color5oooooooooo$endoooooo" > /tmp/brightness;;
  10)     notify-send -p $NID "Brightness:" "$col$color6ooooooooooo$endooooo" > /tmp/brightness;;
  11)     notify-send -p $NID "Brightness:" "$col$color6oooooooooooo$endoooo" > /tmp/brightness;;
  12)     notify-send -p $NID "Brightness:" "$col$color7ooooooooooooo$endooo" > /tmp/brightness;;
  13)     notify-send -p $NID "Brightness:" "$col$color7oooooooooooooo$endoo" > /tmp/brightness;;
  14)     notify-send -p $NID "Brightness:" "$col$color8ooooooooooooooo$endo" > /tmp/brightness;;
  15)     notify-send -p $NID "Brightness:" "$col$color8oooooooooooooooo$end" > /tmp/brightness;;
esac
