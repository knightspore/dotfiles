# Defined in - @ line 1
function xs --wraps='sudo /opt/lampp/lampp stop' --description 'alias xs=sudo /opt/lampp/lampp stop'
  sudo /opt/lampp/lampp stop $argv;
end
