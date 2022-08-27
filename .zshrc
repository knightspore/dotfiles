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
alias gdc="git diff HEAD~1"
alias gst="git status"
alias l="clear && ls -a"
alias nvimsetup="ln -s ~/.vimrc ~/.config/nvim/init.vim"
alias o="xdg-open ."
alias rf="rm -rf"
alias sizes="dust -d 1 ."

# NVIM
alias vim=nvim

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/c/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/c/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/c/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/c/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# InDebted auto-generated
[ -s "~/.aws.zsh" ] && \. source ~/.aws.zsh

# ASDF
[ -s "/usr/local/opt/asdf" ] && \. . /usr/local/opt/asdf/libexec/asdf.sh && \. source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"
