export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# Brew
alias brow='arch -x86_64 /usr/local/bin/brew'
alias ib='arch -x86_64'

export PATH="$HOME/.bin:$PATH"
export HOMEBREW_NO_AUTO_UPDATE=1
export PATH="$(go env GOPATH)/bin:$PATH"

# Theme
eval "$(starship init zsh)"

# Stop the docker boi
alias dockerstop='docker kill $(docker ps -q)'

# XAuth for trusted X11 tunelling
alias ssh='ssh -o "XAuthLocation=/opt/X11/bin/xauth"'
export PATH="/opt/homebrew/opt/php@8.1/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"

# bun completions
[ -s "/Users/simonbencik/.bun/_bun" ] && source "/Users/simonbencik/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/go@1.20/bin:$PATH"
