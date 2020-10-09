# Defined in - @ line 1
function gra --wraps='git remote add origin' --description 'alias gra=git remote add origin'
  git remote add origin $argv;
end
