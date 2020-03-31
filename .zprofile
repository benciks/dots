# Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# qt themes
export QT_STYLE_OVERRIDE=adwaita-dark

# Start x server on tty1
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx
fi
