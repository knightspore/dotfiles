# Defined in - @ line 1
function branches --wraps='git branch --list' --description 'alias branches=git branch --list'
  git branch --list $argv;
end
