# Defined in - @ line 1
function dev --wraps='cd /home/knightspore/Desktop/dev' --wraps='cd /home/knightspore/Desktop/dev && clear && ls -a -l' --wraps='cd /home/knightspore/Desktop/dev; clear; ls -a -l' --wraps='cd /home/knightspore/Desktop/dev; l;' --wraps='cd /home/knightspore/Desktop/dev; clear; l' --wraps='cd ~/Desktop/dev; clear; l' --description 'alias dev=cd ~/Desktop/dev; clear; l'
  cd ~/Desktop/dev; clear; l $argv;
end
