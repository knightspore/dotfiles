# Defined in - @ line 1
function dl --wraps='cd ~/Downloads' --wraps='cd ~/Downloads; clear; ls -a -l' --wraps='cd ~/Downloads; clear; ls -a' --description 'alias dl=cd ~/Downloads; clear; ls -a'
  cd ~/Downloads; clear; ls -a $argv;
end
