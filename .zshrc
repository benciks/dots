# zsh history
HISTFILE=~/.zsh_history
SAVEHIST=100

# plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# theme
# source ~/.zsh/clean/clean.zsh-theme
eval "$(starship init zsh)"

# alias
alias tmux='TERM=xterm tmux'
alias rebase-up='git pull upstream master --rebase --autostash'
alias ix="curl -F 'f:1=<-' ix.io"
