export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="dracula"
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh
export EDITOR='nvim'

alias c=clear
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias dl="cd ~/Downloads; clear; ls -a"
alias dsk="cd ~/Desktop/ && l"
alias gcom="git add . && git commit -m"
alias gem="gitmoji -c"
alias glp="git log --pretty=oneline"
alias gpo="git push origin"
alias gdc="git diff --cached"
alias gst="git status"
alias l="clear && ls -a"
alias nvimsetup="ln -s ~/.vimrc ~/.config/nvim/init.vim"
alias o="xdg-open ."
alias rf="rm -rf"
alias sizes="dust -d 1 ."
alias python=python3

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

