# zmodload zsh/zprof;

if [ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" = "Dark" ]; then
    source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
else
    source ~/.zsh/catppuccin_latte-zsh-syntax-highlighting.zsh
fi

alias cfg="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias dl="cd ~/Downloads"
alias dv="cd ~/Developer"
alias dc="cd ~/Documents"
alias dcp="cd ~/Documents/Planner"
alias rgf='rg --files | rg'
alias d1="/run/media/c/Slem1000/"
alias d2="/run/media/c/Slem2000/"
alias vc="nvim ~/.config/nvim/init.lua"
alias zc="nvim ~/.zshrc"
alias ac="nvim ~/.config/alacritty/alacritty.toml"
alias gc="nvim ~/.config/ghostty/config"
alias tc="nvim ~/.tmux.conf"

alias c=clear
alias cat="bat"
alias nvm="fnm"
alias pa="php artisan"
alias sys="sudo systemctl"
alias vi=nvim
alias vim=nvim

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

## Prompt
PT="%(?.%F{blue}[%T].%F{magenta}[%T])%f" # Time
PD="%F{magenta}%~%f" # Directory
PS="%(?.%F{green}$.%F{magenta}$)%f" # Formatted Prompt
PROMPT="${PT} ${PD} ${PS} "

export EDITOR='nvim'

export DENO_INSTALL="/Users/c/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="/Users/c/Developer/stack/.bin:$HOME/.config/composer/vendor/bin:/Users/c/.composer/vendor/bin:/opt/homebrew/opt/util-linux/bin:/opt/homebrew/opt/util-linux/sbin:$PATH"


export PATH="$HOME/.local/share/fnm:$PATH"
eval "$(fnm env)"

export PATH="$HOME/.opencode/bin:$PATH"

export PATH="$PATH:/Users/c/.local/bin"

source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(fzf --zsh)"

# zprof
