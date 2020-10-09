# Defined in - @ line 1
function pull --wraps='git pull origin' --description 'alias pull=git pull origin'
  git pull origin $argv;
end
