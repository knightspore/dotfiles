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
alias dev="cd ~/Desktop/dev; clear; l"
alias devenv="tmuxp load .tmuxp/dev.yaml --yes"
alias dl="cd ~/Downloads; clear; ls -a"
alias dsk="cd ~/Desktop/ && l"
alias gcom="git add . && git commit -m"
alias gem="gitmoji -c"
alias glp="git log --pretty=oneline"
alias gpo="git push origin"
alias gst="git status"
alias l="clear && ls -a"
alias nvimsetup="ln -s ~/.vimrc ~/.config/nvim/init.vim"
alias o="xdg-open ."
alias rf="rm -rf"
alias sizes="dust -d 1 ."
alias vim=nvim
source /usr/share/nvm/init-nvm.sh
