# Defined in - @ line 1
function dsk --wraps='cd ~/Desktop/' --wraps='cd ~/Desktop/ && l' --description 'alias dsk=cd ~/Desktop/ && l'
  cd ~/Desktop/ && l $argv;
end
