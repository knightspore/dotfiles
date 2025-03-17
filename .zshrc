# zmodload zsh/zprof;
# ZSH Config

export ZSH="$HOME/.oh-my-zsh"

source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

plugins=(
  zsh-autocomplete
  zsh-autosuggestions
  zsh-syntax-highlighting
  git
  git-prompt
)

# Autocomplete
zstyle ':autocomplete:*' min-input 3

source $ZSH/oh-my-zsh.sh

## Prompt

PT='%(?.%F{blue}[%T].%F{magenta}[%T])%f' # Time
PD='%F{magenta}%~%f' # Directory
PS='%(?.%F{green}$.%F{magenta}$)%f' # Formatted Prompt
PROMPT='${PT} ${PD} ${PS} '

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
alias cat="bat"
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias cfg="config"
alias dl="cd ~/Downloads; clear; ls -a"
alias dsk="cd ~/Desktop/"
alias dev="cd ~/Developer"
alias rgf='rg --files | rg'
alias d1="/run/media/c/Slem1000/"
alias d2="/run/media/c/Slem2000/"
alias vim=nvim
alias pa="php artisan"
alias lastupdated="db 'SELECT lastUpdated FROM travel.bookingThreads LIMIT 1'"
alias vimcnf="nvim ~/.config/nvim/init.lua"
alias zshcnf="nvim ~/.zshrc"
alias alacnf="nvim ~/.config/alacritty/alacritty.toml"
alias ghocnf="nvim ~/.config/ghostty/config"
alias tmucnf="nvim ~/.tmux.conf"
alias nvm="fnm"
alias sys="sudo systemctl"

## Git

alias gdt="git difftool --tool=nvimdiff"
alias gdtc="git difftool --tool=nvimdiff --cached"
alias gundo="git reset HEAD~1"

# ---

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

## FZF

eval "$(fzf --zsh)"

## Exec into nomad

function nomad-exec() {
    nomad alloc exec -i -t -task mysql $1 /bin/bash
}

## brew util-linux
export PATH="/opt/homebrew/opt/util-linux/bin:$PATH"
export PATH="/opt/homebrew/opt/util-linux/sbin:$PATH"

# fnm
if [ -d "$HOME/.local/share/fnm" ]; then
  export PATH="$HOME/.local/share/fnm:$PATH"
  eval "$(fnm env)"
fi

# zprof
