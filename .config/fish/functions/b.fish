# Defined in - @ line 1
function b --wraps='cd ..' --wraps='cd .. && pwd' --description 'alias b=cd .. && pwd'
  cd .. && pwd $argv;
end
