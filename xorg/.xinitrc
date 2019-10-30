[[ -f ~/.Xresources ]] && xrdb -merge -I $HOME ~/.Xresources

xset r rate 180 35
./.screenlayout/default.sh

if [ -f /usr/bin/i3 ]; then
  setxkbmap -layout se
  exec i3
fi
