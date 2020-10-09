# Defined in - @ line 1
function gcom --wraps='git commit -m' --wraps='git add . && git commit -m' --description 'alias gcom=git add . && git commit -m'
  git add . && git commit -m $argv;
end
