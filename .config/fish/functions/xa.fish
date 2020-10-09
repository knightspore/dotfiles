# Defined in - @ line 1
function xa --wraps='sudo /opt/lampp/manager-linux-x64.run' --wraps='sudo /opt/lampp/lampp start' --description 'alias xa=sudo /opt/lampp/lampp start'
  sudo /opt/lampp/lampp start $argv;
end
