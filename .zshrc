# ZSH Config

export ZSH="$HOME/.oh-my-zsh"

source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh

# ---

# OS Config

## Shared

export EDITOR='nvim'

## MacOS

if [ "$(uname)" = "Darwin" ]; then
  export BROWSER="/Applications/Brave\ Browser.app/Contents/MacOS/Brave\ Browser"
  export HOMEBREW_NO_AUTO_UPDATE=1
fi

# ---

# Aliases

## General Purpose / Navigation

alias c=clear
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias dl="cd ~/Downloads; clear; ls -a"
alias dsk="cd ~/Desktop/ && l"
alias dev="cd ~/Developer/ && l"
alias dev="cd ~/Developer"
alias l="clear && ls -a"
alias sizes="dust -d 1 ."
alias rgf='rg --files | rg'
alias d1="/run/media/c/Slem1000/"
alias d2="/run/media/c/Slem2000/"
alias vim=nvim
alias pa="php artisan"
alias lastupdated="db 'SELECT lastUpdated FROM bookingThreads LIMIT 1'"
alias vimcnf="nvim ~/.config/nvim/init.lua"
alias zshcnf="nvim ~/.zshrc"
alias alacnf="nvim ~/.config/alacritty/alacritty.toml"

## Git

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

# ---

# Path / Software Setup

## Terraform

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

## Node Version Manager

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

## Deno

export DENO_INSTALL="/Users/c/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

## Bun

[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

## Tripco TL

export PATH="/Users/c/Developer/stack/.bin:$PATH"

## Composer

export PATH="/Users/c/.composer/vendor/bin:$PATH"

## PHPActor

export PATH="/Users/c/.local/bin:$PATH"

## Rust

. "$HOME/.cargo/env"

## Ruby

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# ---

# Starship Shell Prompt

eval "$(starship init zsh)"
