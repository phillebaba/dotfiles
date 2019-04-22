[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

if [ -f /usr/bin/i3 ]; then
	setxkbmap -layout se
  exec i3
fi
