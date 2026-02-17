# zmodload zsh/zprof;

if [ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" = "Dark" ]; then
    source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
else
    source ~/.zsh/catppuccin_latte-zsh-syntax-highlighting.zsh
fi
export ZSH="$HOME/.oh-my-zsh"

plugins=(
  zsh-autocomplete
  zsh-syntax-highlighting
)

zstyle ':autocomplete:*' min-input 4
source $ZSH/oh-my-zsh.sh

## Prompt
PT='%(?.%F{blue}[%T].%F{magenta}[%T])%f' # Time
PD='%F{magenta}%~%f' # Directory
PS='%(?.%F{green}$.%F{magenta}$)%f' # Formatted Prompt
PROMPT='${PT} ${PD} ${PS} '

export EDITOR='nvim'

if [ "$(uname)" = "Darwin" ]; then
  export BROWSER="/Applications/Brave\ Browser.app/Contents/MacOS/Brave\ Browser"
  export HOMEBREW_NO_AUTO_UPDATE=1
fi

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
alias vi=nvim
alias vim=nvim
alias pa="php artisan"
alias vimcnf="nvim ~/.config/nvim/init.lua"
alias zshcnf="nvim ~/.zshrc"
alias alacnf="nvim ~/.config/alacritty/alacritty.toml"
alias ghocnf="nvim ~/.config/ghostty/config"
alias tmucnf="nvim ~/.tmux.conf"
alias nvm="fnm"
alias sys="sudo systemctl"

alias g=git
alias ga='git add --verbose'
alias gb='git branch'
alias gcB='git checkout -B'
alias gcmsg='git commit --message'
alias gco='git checkout'
alias gd='git diff'
alias gdca='git diff --cached'
alias gds='git diff --staged'
alias gdt="git difftool --tool=nvimdiff"
alias gdtc="git difftool --tool=nvimdiff --cached"
alias gdup='git diff @{upstream}'
alias gdw='git diff --word-diff'
alias gdwc='git diff --cached --word-diff'
alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
alias gl='git pull'
alias glo='git log --oneline --decorate'
alias gm='git merge'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gp='git push --verbose'
alias gpr='git pull --rebase'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grev='git revert'
alias greva='git revert --abort'
alias grevc='git revert --continue'
alias grf='git reflog'
alias grh='git reset --hard'
alias grm='git rm'
alias gst='git status --verbose'
alias gsta='git stash push'
alias gstaa='git stash apply'
alias gstall='git stash --all'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsw='git switch'

export DENO_INSTALL="/Users/c/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="/Users/c/Developer/stack/.bin:$HOME/.config/composer/vendor/bin:/Users/c/.composer/vendor/bin:/opt/homebrew/opt/util-linux/bin:/opt/homebrew/opt/util-linux/sbin:$PATH"

eval "$(fzf --zsh)"

if [ -d "$HOME/.local/share/fnm" ]; then
  export PATH="$HOME/.local/share/fnm:$PATH"
  eval "$(fnm env)"
fi

export PATH="$HOME/.opencode/bin:$PATH"

export PATH="$PATH:/Users/c/.local/bin"

# zprof
