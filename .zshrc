export BROWSER="/usr/bin/brave"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="dracula"
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-autocomplete
)
source $ZSH/oh-my-zsh.sh
export EDITOR='nvim'

alias c=clear
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias dl="cd ~/Downloads; clear; ls -a"
alias dsk="cd ~/Desktop/ && l"
alias dev="cd ~/Developer/ && l"
alias gcom="git add . && git commit -m"
alias glp="git log --pretty=oneline"
alias gpo="git push origin"
alias gdc="git diff --cached"
alias gdl="git diff --name-only"
alias gdt="git difftool --tool=nvimdiff"
alias gdtc="git difftool --tool=nvimdiff --cached"
alias gdw="git diff --word-diff"
alias gdwc="git diff --word-diff --cached"
alias gst="git status"
alias gundo="git reset HEAD~1"
alias gbhist='git branch --format="%(refname:short) %(committerdate:relative)"'
alias l="clear && ls -a"
alias nvimsetup="ln -s ~/.vimrc ~/.config/nvim/init.vim"
alias o="xdg-open ."
alias rf="rm -rf"
alias sizes="dust -d 1 ."
alias python=python3
alias rgf='rg --files | rg'
alias pa="php artisan"

## Drives on Desktop
alias d1="/run/media/c/Slem1000/"
alias d2="/run/media/c/Slem2000/"

# NVIM
alias vim=nvim

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/c/.bun/_bun" ] && source "/home/c/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Tripco TL
export PATH="/Users/c/Developer/stack/.bin:$PATH"

# Composer
export PATH="/Users/c/.composer/vendor/bin:$PATH"

# bun completions
[ -s "/Users/c/.bun/_bun" ] && source "/Users/c/.bun/_bun"

# deno 
export DENO_INSTALL="/Users/c/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# phpactor
export PATH="/Users/c/.local/bin:$PATH"

# rustup
. "$HOME/.cargo/env"

# Ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
