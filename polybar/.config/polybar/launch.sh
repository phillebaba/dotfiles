#! /usr/bin/env bash

sleep 1;

killall -q polybar

for m in $(polybar --list-monitors | cut -d":" -f1); do
  WIRELESS=$(ls /sys/class/net | grep wl) ETHERNET=$(ls /sys/class/net | grep enp) MONITOR=$m polybar --reload top &
done
