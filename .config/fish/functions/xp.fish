# Defined in - @ line 1
function xp --wraps='sudo /opt/lampp/manager-linux-x64.run' --description 'alias xp=sudo /opt/lampp/manager-linux-x64.run'
  sudo /opt/lampp/manager-linux-x64.run $argv;
end
