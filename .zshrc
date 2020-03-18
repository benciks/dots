# Path to your oh-my-zsh installation.
export ZSH="/home/upwell/.oh-my-zsh"

ZSH_THEME="spaceship"

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# nvm setup
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Start x server on tty1
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	exec startx
fi
