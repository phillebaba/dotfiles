[[ -f ~/.Xresources ]] && xrdb -merge -I $HOME ~/.Xresources

./.screenlayout/default.sh

if [ -f /usr/bin/i3 ]; then
  setxkbmap -layout se
  exec i3
fi
