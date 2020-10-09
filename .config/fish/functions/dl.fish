# Defined in - @ line 1
function dl --wraps='cd ~/Downloads' --wraps='cd ~/Downloads; clear; ls -a -l' --description 'alias dl=cd ~/Downloads; clear; ls -a -l'
  cd ~/Downloads; clear; ls -a -l $argv;
end
